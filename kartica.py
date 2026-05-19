from flask import Flask, render_template
from flask_frozen import Freezer

app = Flask(__name__)
freezer = Freezer(app)


@app.route("/")
def home(name=None):
    return render_template('index.html', name=name)


@app.route("/portfolio/")
def portfolio(name=None):
    return render_template('portfolio.html', name=name)


if __name__ == "__main__":
    freezer.freeze()


