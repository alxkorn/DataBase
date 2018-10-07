import os
from PyQt5 import QtCore, QtWidgets, uic
from db_mod import connect, disconnect, call_saved_procedure, executeQuery

class ExternalContract(QtWidgets.QWidget):
    def __init__(self, db, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        uic.loadUi(os.path.join(os.path.dirname(__file__), 'GUI', 'externalcontract.ui'), self)

        self.db = db
        self.orderSum = 0
        
        self.UploadToDBButton.clicked.connect(self.upload2db)
        self.AddToChosenProductButton.clicked.connect(self.moveProductToChosenTable)
        self.DeleteProductFromAddedButton.clicked.connect(self.deleteProductFromChosenTable)
        self.fillAllProductsTable()

    def getFieldsData(self):
        self.contract_number = self.ContractNumberLine.text()
        self.date_start = self.Date1Line.text()
        self.end_date = self.Date2Line.text()
        self.customer_name = self.ClientNameLine.text()
        self.delivery_agent = self.DeliveryAgentNameLine.text()

        if self.DeliveryAgentBinaryIndicatorComboBox.currentText() == 'No':
            self.delivery_agent = None
        
        #return (contract_number, date_start, end_date, customer_name, delivery_agent)
    
    def _addSingleProduct_dict(self, tablewidget, productDict):
        col_names = {'Наименование':0, 'Стоимость':1, 'Единица измерения':2}
        rows_count = tablewidget.rowCount()
        tablewidget.insertRow(rows_count)
        for col_name in col_names:
            tablewidget.setItem(rows_count, col_names[col_name], 
                                QtWidgets.QTableWidgetItem(str(productDict[col_name])))
   
    def _addSingleProduct_QT(self, tablewidget, qt_list):
            rows_count = tablewidget.rowCount()
            tablewidget.insertRow(rows_count)
            for item_num in range(len(qt_list)):
                tablewidget.setItem(rows_count, item_num, 
                                    QtWidgets.QTableWidgetItem(qt_list[item_num]))
    
    def fillAllProductsTable(self):
        products = executeQuery(self.db, """SELECT `Наименование`, `Стоимость`, `Единица измерения`
                                 FROM `Товар`;""")
        for product in products:
            self._addSingleProduct_dict(self.AllProductToAddTableWidget, product)
    
    def moveProductToChosenTable(self, product):
        allProd = self.AllProductToAddTableWidget
        selected_product = allProd.selectedItems()
        if not selected_product:
            return
        quantity = self.QuantityOfProductToAddLine.text()
        if not len(quantity):
            return
        quantity = int(quantity)
        selected_product.append(QtWidgets.QTableWidgetItem(str(quantity)))
        self._addSingleProduct_QT(self.AddedProductWithQuantityTableWidget, selected_product)
        
        self.orderSum += quantity*int(selected_product[1].text())
        self.sumLabel.setText(str(self.orderSum))

    def deleteProductFromChosenTable(self):
        selectedProdTable = self.AddedProductWithQuantityTableWidget
        selected_product = selectedProdTable.selectedItems()
        if not selected_product:
            return
        
        quantity = int(selected_product[-1].text())
        price = int(selected_product[1].text())
        self.orderSum -= quantity*price
        self.sumLabel.setText(str(self.orderSum))

        row = selectedProdTable.row(selected_product[0])
        selectedProdTable.removeRow(row)
    
    def uploadGoodsRecordsToContract(self, contract_id):
        selectedProdTable = self.AddedProductWithQuantityTableWidget
        goods_cnt = selectedProdTable.rowCount()

        for row in range(goods_cnt):
            good_name = selectedProdTable.item(row, 0).text()
            good_quantity = selectedProdTable.item(row, selectedProdTable.columnCount()-1).text()
            print(good_name, good_quantity)

            good_id = call_saved_procedure(self.db, 'goodid_by_name', [good_name])
            good_id = good_id[0]['idТовар']
            proc_args = [contract_id, good_id, good_quantity]
            call_saved_procedure(self.db, 'add_contract_good_record', proc_args)

    def upload2db(self):
        self.getFieldsData()
        if (self.delivery_agent is not None) and (not self.delivery_agent):
            #print("Incorrect delivery agent!")
            return
        if not(self.contract_number and self.date_start and self.end_date and self.customer_name):
            #print("Some fields empty!!")
            return

        id_buyer = call_saved_procedure(self.db, 'buyerid_by_name', [self.customer_name])
        if not len(id_buyer):
            print("Incorrect buyer credentials!")
            return
        id_buyer = id_buyer[0]['idПокупатель']

        id_deliver = call_saved_procedure(self.db, 'deliverid_by_name', [self.delivery_agent])
        if (self.delivery_agent is not None) and (not len(id_deliver)):
            print("Incorrect delivery agent credentials!")
            return
        

        print([self.contract_number, self.date_start, self.end_date, id_buyer])
        try:
            call_saved_procedure(self.db, 'add_contract', [self.contract_number, self.date_start, 
                                                           self.end_date, id_buyer])
        except Exception as e:
            print(e)

        contract_id = call_saved_procedure(self.db, 'contractid_by_number', [self.contract_number])
        contract_id = contract_id[0]['idДоговор']
        self.uploadGoodsRecordsToContract(contract_id)

        if self.delivery_agent is not None:
            id_deliver = id_deliver[0]['idПеревозчик']
            call_saved_procedure(self.db, 'add_contract_delivery_record', [contract_id, id_deliver])

        

        
        

