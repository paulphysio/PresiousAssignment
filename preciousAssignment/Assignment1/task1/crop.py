import csv
import pandas as pd
import numpy as np

def crop(file):
    main = []
    df=pd.read_csv(file, iterator=True, chunksize=1000, delimiter=";")
    for chunk in df:
        chunk=chunk.fillna('0')
        old_ti=[]
        new_ti=[]
        for i in chunk["Date Time"]:
            if len(i)==25:
                val=i[0]+i[1]+i[2]+i[3]
                
                if int(val) >= 2010:
                    new_ti.append(i)
                    old_ti.append(i)
                else:
                    new_ti.append(np.nan)
                    old_ti.append(i)
            else:
                new_ti.append(np.nan)
                old_ti.append(i)
        chunk["Date Time"]=chunk["Date Time"].replace(old_ti, new_ti)
        new_df=chunk.dropna()

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
    print("Do not open file yet, wait for code to finish running.....")
    with open('crop.csv', 'r') as file:
        data=file.read()
        data = data.replace("\"", "")
        with open("crop.csv", "w") as output:
            output.write(data)
    return "Done"
    
crop("files.csv")
