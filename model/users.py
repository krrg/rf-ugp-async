from model.validators import *


class Users(object):

    @staticmethod
    @requires_exactly(['id', 'email'])
    def create(**kwargs):