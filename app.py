from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/")
def hello():
    return jsonify(message="Hola Mundo"), 200

if __name__ == "__main__":
    # útil para correr local, en prod Render usará el CMD del Dockerfile (gunicorn)
    app.run(host="0.0.0.0", port=8000)