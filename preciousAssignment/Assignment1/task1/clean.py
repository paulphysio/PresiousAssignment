import pandas as pd
import numpy as np
import csv


def clean(file):
    
    main_list = []
    df=pd.read_csv('Book1.csv', iterator=True, chunksize=10000, sep=";")
    
    for chunks in df:
        chunks.to_csv('file.csv', index=False)
        pf=pd.read_csv('file.csv')
        chunked=pf.fillna('')

        old_list=[]
        new_list=[]
        for i in chunked.get("SiteID"):
            if i=="" or type(i)==int:
                old_list.append(i)
                i=np.nan
                new_list.append(i)
            else:
                old_list.append(i)
                new_list.append(i)

        chunked["SiteID"]=chunked["SiteID"].replace(old_list, new_list)
        new_df=chunked.dropna()


        main_list.append(new_df)
    final_list=pd.concat(main_list)
    final_list.to_csv("clean.csv", index=False)
    with open('clean.csv', 'r') as file:
        data=file.read()
        data = data.replace(";", ",").replace("\"", "")
        with open("clean.csv", "w") as output:
            output.write(data)

clean("crop.csv")
