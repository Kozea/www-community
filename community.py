#!/usr/bin/env python3

import jinja2
from flask import Flask, Response, abort, render_template

app = Flask(__name__)

# Secret key doesn't have to be changed, it is only used for flash messages
app.secret_key = 'secret key'
app.config.from_envvar('WWW_COMMUNITY_CONFIG', silent=True)


@app.route('/')
@app.route('/<page>')
def page(page='index'):
    try:
        return render_template('{}.html'.format(page), page=page)
    except jinja2.exceptions.TemplateNotFound:
        abort(404)


@app.route('/robots.txt')
def robots():
    return Response('User-agent: *\nDisallow: \n', mimetype='text/plain')


@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html', page='404'), 404


if __name__ == '__main__':
    from sassutils.wsgi import SassMiddleware
    app.wsgi_app = SassMiddleware(app.wsgi_app, {
        'community': ('sass', 'static/css', '/static/css')})
    app.run(debug=True)
    app.run(debug=True)
