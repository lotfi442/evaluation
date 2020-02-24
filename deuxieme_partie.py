import pandas as pd, sqlalchemy
from re import findall
from sqlalchemy import create_engine

engine = sqlalchemy.create_engine(
        'mysql+pymysql://root:RNE_azerty'
        'y@localhost:3306')


data.to_sql('categorie_professionelle', con=engine, if_exists='append', index =False,
                     schema = 'RNE')


data.to_sql('code_nuances', con=engine, if_exists='replace', index =False,
                     schema = 'RNE')

data.to_sql('departements', con=engine, if_exists='replace', index =False,
                     schema = 'RNE')

data.to_sql('elus_mun2014', con=engine, if_exists='replace', index =False,
                     schema = 'RNE')

data.to_sql('libellé des colonnes', con=engine, if_exists='replace', index =False,
                     schema = 'RNE')

data.to_sql('population2017', con=engine, if_exists='replace', index =False,
                     schema = 'RNE')