import os
from PyQt5 import QtCore, QtWidgets, uic
from db_mod import call_saved_procedure, executeQuery

class DeliveryAgentClient(QtWidgets.QWidget):
    def __init__(self, db, upload_proc_name, fill_type, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        uic.loadUi(os.path.join(os.path.dirname(__file__), 'GUI', 'ExternalDeliveryAgentAndClient.ui'), self)
        
        self.db = db

        self.upload_proc_name = upload_proc_name
        self.fill_type = fill_type

        self.fillTable()
        self.UploadToDBButton.clicked.connect(self.upload2db_refresh)

    def getFieldsData(self):
        self.agentClientName = self.DeliveryAgentOrClientNameLine.text()
        self.agentClientAddress = self.DeliveryAgentOrClientAddressLine.text()
        self.checkingAccount = self.CheckingAcountOfDeliveryAgentOrClientLine.text()
        self.inn = self.DeliveryAgentOrClientINNLine.text()

    def _addSingle_dict(self, tablewidget, fields_dict):
            col_names = {'Наименование':0, 'Адрес':1, 'Расчетный счет':2, 'ИНН':3}
            cols_convert = {'Наименование':'Наименование', 'Адрес':'Адрес',
                            'Расчетный счет':'Банковский реквизит', 'ИНН':'Налоговый реквизит'}

            rows_count = tablewidget.rowCount()
            tablewidget.insertRow(rows_count)
            for col_name in col_names:
                tablewidget.setItem(rows_count, col_names[col_name], 
                                    QtWidgets.QTableWidgetItem(str(fields_dict[cols_convert[col_name]])))

    def fillTable(self):
        self.DeliveryAgentOrClientResultTableWidget.setRowCount(0)

        fill_vals = executeQuery(self.db, """SELECT `Наименование`, `Адрес`, `Банковский реквизит`, `Налоговый реквизит`
                                                FROM `{0}`;""".format(self.fill_type))
        for fill in fill_vals:
            self._addSingle_dict(self.DeliveryAgentOrClientResultTableWidget, fill)

    def upload2db_refresh(self):
        self.getFieldsData()
        
        if not(self.agentClientName and self.agentClientAddress and self.checkingAccount and self.inn):
            print("Error in fields")
            return
        proc_args = [self.agentClientName, self.agentClientAddress, self.checkingAccount, self.inn]
        
        call_saved_procedure(self.db, self.upload_proc_name, proc_args)
        self.fillTable()
        

