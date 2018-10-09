import os
from PyQt5 import QtCore, QtWidgets, uic
from externalcontract import ExternalContract
from delivery_agent_client import DeliveryAgentClient
from externalmat import ExternalMat
from externaldocument import ExternalDocument
from externaldept import Dept
from db_mod import connect, disconnect

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        QtWidgets.QWidget.__init__(self)
        uic.loadUi(os.path.join(os.path.dirname(__file__), 'GUI', 'mainwindow.ui'), self)

        self.db = connect('localhost', 'root', 'password')

        # Set up external contracts tab
        self.external_contract = ExternalContract(self.db, parent=self.InternalContractWidget)
        self.ContractLayout.addWidget(self.external_contract)

        self.client_widget = DeliveryAgentClient(self.db, 'add_buyer', 'Покупатель', parent=self.InternalClientWidget)
        self.ClientLayout.addWidget(self.client_widget)

        self.delivery_agent_widget = DeliveryAgentClient(self.db, 'add_delivery', 'Перевозчик', parent=self.InternalDeliveryAgentWidget)
        self.DeliveryAgentLayout.addWidget(self.delivery_agent_widget)

        self.add_mat = ExternalMat(self.db, parent=self.InternalMaterialWidget)
        self.MaterialLayout.addWidget(self.add_mat)
        
        self.add_doc = ExternalDocument(self.db, parent=self.InternalDocumentWidget)
        self.DocumentLayout.addWidget(self.add_doc)

        self.staff_x = Dept(self.db, parent=self.InternalDepartmentWidget)
        self.DepartmentLayout.addWidget(self.staff_x)

    def __del__(self):
        disconnect(self.db)
    

