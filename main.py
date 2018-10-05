# flask_web/app.py

from flask import Flask
import os
app = Flask(__name__)

@app.route('/')
def hello_world():
    print("HAI")
    return 'Hey, we have Flask in a Docker container!'

@app.route('/health')
def health():
    print("HALO")
    return 'OK'

print(__name__)
if __name__ == "__main__":
    port = 5000
    try:
        port = int(os.environ['PORT'])
        print("$PORT detected, starting on port: {}".format(port))
    except:
        print("No $PORT detected, starting on default port: {}".format(port))
    app.run(debug=False, port=port)
