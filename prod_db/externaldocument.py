import os
from PyQt5 import QtCore, QtWidgets, uic
from db_mod import call_saved_procedure, executeQuery

class ExternalDocument(QtWidgets.QWidget):
    def __init__(self, db, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        uic.loadUi(os.path.join(os.path.dirname(__file__), 'GUI', 'externaldocument.ui'), self)

        self.UploadToDBButton.clicked.connect(self.upload2db)
        self.db = db

        self.fillAllMatTable()

    def getFieldsData(self):
        self.doc_name = self.DocumentNameLine.text()
        self.doc_type = self.DocumentTypeLine.text()

    def _addSingleDoc_dict(self, tablewidget, productDict):
        col_names = {'Наименование':1, 'Тип документа':0}
        rows_count = tablewidget.rowCount()
        tablewidget.insertRow(rows_count)
        for col_name in col_names:
            tablewidget.setItem(rows_count, col_names[col_name], 
                                QtWidgets.QTableWidgetItem(str(productDict[col_name])))

    def fillAllMatTable(self):
        self.DocumentTableWidget.setRowCount(0)
        docs = executeQuery(self.db, """SELECT `Наименование`, `Тип документа`
                                 FROM `Нормативный документ`;""")
        for doc in docs:
            self._addSingleDoc_dict(self.DocumentTableWidget, doc)

    def upload2db(self):
        self.getFieldsData()
        proc_args = [self.doc_type,self.doc_name]
        call_saved_procedure(self.db, 'add_regul_doc', proc_args)
        self.fillAllMatTable()