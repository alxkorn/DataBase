import os
from PyQt5 import QtCore, QtWidgets, uic
from db_mod import call_saved_procedure, executeQuery

class Dept(QtWidgets.QWidget):
    def __init__(self, db, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        uic.loadUi(os.path.join(os.path.dirname(__file__), 'GUI', 'dept.ui'), self)

        self.db = db

        self.fillComboBox()
        self.GetInfo.clicked.connect(self.fillAllWorkerTable)        
        #self.fillAllMatTable()

    def fillComboBox(self):
        deps = executeQuery(self.db, """select `Наименование` from `Отдел`;""")
        for dept in deps:
            dept_name = dept['Наименование']
            self.comboBox.addItem(dept_name)

    def _addSingleWorker_dict(self, tablewidget, productDict):
        col_names = {'ФИО':0, 'Размер ЗП':1}
        rows_count = tablewidget.rowCount()
        tablewidget.insertRow(rows_count)
        for col_name in col_names:
            tablewidget.setItem(rows_count, col_names[col_name], 
                                QtWidgets.QTableWidgetItem(str(productDict[col_name])))

    def fillAllWorkerTable(self):
        self.workerTable.setRowCount(0)
        proc_args = [self.comboBox.currentText()]
        workers = call_saved_procedure(self.db, 'worker_by_depart',proc_args)

        for worker in workers:
            self._addSingleWorker_dict(self.workerTable, worker)

        zp = call_saved_procedure(self.db,'summa_zp_otdela',[self.comboBox.currentText()])[0]['sum']
        self.zp.setText(str(zp))
        self.fillAllGoodsTable()


    def _addSingleGood_dict(self, tablewidget, productDict):
        rows_count = tablewidget.rowCount()
        tablewidget.insertRow(rows_count)
        tablewidget.setItem(rows_count, 0, QtWidgets.QTableWidgetItem(str(productDict['Наименование'])))

    def fillAllGoodsTable(self):
        self.goodsTable.setRowCount(0)
        dept = self.comboBox.currentText()
        dpt_goods = call_saved_procedure(self.db, 'tovary_y_otdela', [dept])
        for good in dpt_goods:
            self._addSingleGood_dict(self.goodsTable, good)