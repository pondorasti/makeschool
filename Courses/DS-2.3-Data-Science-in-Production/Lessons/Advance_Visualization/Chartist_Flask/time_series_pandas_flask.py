from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
from functools import reduce
import pandas as pd


# curl "http://0.0.0.0:3000/?n=2004&n=2005&m=diet&m=gym"
# https://www.datacamp.com/community/tutorials/time-series-analysis-tutorial

app = Flask(__name__)

df = pd.read_csv('multiTimeline.csv', skiprows=1)
df.columns = ['month', 'diet', 'gym', 'finance']
print(df)

# df_new = df[(df['month'].str.contains('2005'))][['month', 'diet']]

# df_new = df[(reduce(lambda a, b: a | b, (df['month'].str.contains(s) for s in ['2004', '2005'])))][['month', 'diet']]
# df_new = df[(reduce(lambda a, b: a | b, (df['month'].str.contains(s) for s in ['2004', '2005'])))][['month', 'diet', 'gym']]
#
# print(df_new)
#
# df_new['month'] = pd.to_datetime(df_new['month'])
# df_new = df_new.sort_values(by=['month'])
# print(df_new)
# plt.plot(df_new['month'], df_new['diet'])
# plt.plot(df_new['month'], df_new['gym'])
# plt.show()
# print(df_new.to_json())
# print(df_new.to_html())


@app.route('/', methods=['GET'])
def my_route():
    ls_year = request.args.getlist('n')
    ls_col = request.args.getlist('m')
    print(ls_year)

    df_new = df[(reduce(lambda a, b: a | b, (df['month'].str.contains(s) for s in ls_year)))][['month'] + ls_col]

    df_new['month'] = pd.to_datetime(df_new['month'])
    df_new = df_new.sort_values(by=['month'])

    return jsonify(df_new.to_json())


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=3000)