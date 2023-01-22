import pandas as pd
import numpy as np
import csv
import os


def clean(file):
    
    main = []
    df=pd.read_csv(file, iterator=True, chunksize=1000, sep=";")

    for chunk in df:
        chunk.to_csv('file.csv', index=False)
        pf=pd.read_csv('file.csv')
        chunked=pf.fillna(' ')
        

        old_li=[]
        new_li=[]
        for i in chunked.get("SiteID"):
            if i=="" or type(i)!=int:
                old_li.append(i)
                i=np.nan
                new_li.append(i)
            else:
                old_li.append(i)
                new_li.append(i)

        chunked["SiteID"]=chunked["SiteID"].replace(old_li, new_li)
        new_df=chunked.dropna()


        main.append(new_df)
    final_main=pd.concat(main)
    final_main.to_csv("clean.csv", index=False)
    os.remove('file.csv')
    print("Do not open file yet, wait for code to finish running.....")
    with open('clean.csv', 'r') as file:
        data=file.read()
        data = data.replace(";", ",").replace("\"", "")
        with open("clean.csv", "w") as output:
            output.write(data)
    return 'Done'


clean("crop.csv")
