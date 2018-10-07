import os
from PyQt5 import QtCore, QtWidgets, uic
from externalcontract import ExternalContract
from delivery_agent_client import DeliveryAgentClient
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
        
    def __del__(self):
        disconnect(self.db)
    

