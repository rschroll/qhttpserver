include(../qhttpserver.pri)
QHTTPSERVER_BASE = ..
TEMPLATE = lib
CONFIG += plugin

TARGET = qhttpserver
VERSION = 0.1.0

QT += network
QT += qml
QT -= gui

CONFIG += dll debug

INCLUDEPATH += $$QHTTPSERVER_BASE/http-parser

PRIVATE_HEADERS += $$QHTTPSERVER_BASE/http-parser/http_parser.h qhttpconnection.h

PUBLIC_HEADERS += qhttpserver.h qhttprequest.h qhttpresponse.h httpserverplugin.h

HEADERS = $$PRIVATE_HEADERS $$PUBLIC_HEADERS
SOURCES = *.cpp $$QHTTPSERVER_BASE/http-parser/http_parser.c

OBJECTS_DIR = $$QHTTPSERVER_BASE/build
MOC_DIR = $$QHTTPSERVER_BASE/build
DESTDIR = $$QHTTPSERVER_BASE/lib

target.path = $$LIBDIR
headers.path = $$INCLUDEDIR
headers.files = $$PUBLIC_HEADERS
INSTALLS += target headers
