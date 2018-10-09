import os
from PyQt5 import QtCore, QtWidgets, uic
from db_mod import call_saved_procedure, executeQuery

class ExternalMat(QtWidgets.QWidget):
    def __init__(self, db, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        uic.loadUi(os.path.join(os.path.dirname(__file__), 'GUI', 'externalmaterial.ui'), self)

        self.UploadToDBButton.clicked.connect(self.upload2db)
        self.db = db

        self.fillAllMatTable()

    def getFieldsData(self):
        self.mat_name = self.MaterialNameLine.text()
        self.mat_cost = self.MaterialSumLine.text()
        self.mat_unit = self.UnitsLine.text()

    def _addSingleMat_dict(self, tablewidget, productDict):
        col_names = {'Наименование':0, 'Стоимость':1, 'Единица измерения':2}
        rows_count = tablewidget.rowCount()
        tablewidget.insertRow(rows_count)
        for col_name in col_names:
            tablewidget.setItem(rows_count, col_names[col_name], 
                                QtWidgets.QTableWidgetItem(str(productDict[col_name])))

    def fillAllMatTable(self):
        self.MaterialsTableWidget.setRowCount(0)
        mats = executeQuery(self.db, """SELECT `Наименование`, `Стоимость`, `Единица измерения`
                                 FROM `Сырье`;""")
        for mat in mats:
            self._addSingleMat_dict(self.MaterialsTableWidget, mat)

    def upload2db(self):
        self.getFieldsData()
        proc_args = [self.mat_name, self.mat_cost, self.mat_unit]
        call_saved_procedure(self.db, 'add_mat', proc_args)
        self.fillAllMatTable()