import csv
import pandas as pd
import numpy as np

def crop(file):
    main = []
    df=pd.read_csv(file, iterator=True, chunksize=1000, delimiter=";")
    for file_chunk in df:
        file_chunk=file_chunk.fillna(' ')
        old_list=[]
        new_list=[]
        for i in file_chunk["Date Time"]:
            if len(i)==25:
                val=i[0]+i[1]+i[2]+i[3]
                
                if int(val) >= 2010:
                    new_list.append(i)
                    old_list.append(i)
                else:
                    new_list.append(np.nan)
                    old_list.append(i)
            else:
                new_list.append(np.nan)
                old_list.append(i)
        file_chunk["Date Time"]=file_chunk["Date Time"].replace(old_list, new_list)
        new_df=file_chunk.dropna()

        # new_df.to_csv("crop.csv", index=False)
        new_df.reset_index()



        head=""
        a=0
        for i in new_df:
            if a==0:
                head=head+i
                a+=1
            else:
                head=head+";"+i
                a+=1

        a=""
        li=[]
        for i in range(len(new_df)):
            for j in range(len(new_df.iloc[i])):
                if j==0:
                    a=a+str(new_df.iloc[i][j])
                else:
                    a=str(a)+";"+str(new_df.iloc[i][j])
                    
            li.append(a)
            a=""
            
        dicts={head:li}
        last_df=pd.DataFrame(dicts)
        main.append(last_df)
    final_main=pd.concat(main)
    final_main.to_csv("crop.csv", index=False)
    
crop("air-quality-data-continuous.csv")