# -*- coding: utf-8 -*-
# 导入Flask类
import os
import sys
from flask import Flask, jsonify
from flask import request


#实例化，可视为固定格式
app = Flask(__name__)

@app.route('/hello', methods=["get"])
def hello():
    print("hello world")
    return "hello world succeed"

@app.route('/', methods=["get"])
def mm():
    print("main page")
    return "main page"

if __name__ == '__main__':
    # app.run(host, port, debug, options)
    # 默认值：host="127.0.0.1", port=5000, debug=False
    print(sys.args[1])
    app.run(host="0.0.0.0", port=3000,debug=False)