import os
from flask import Flask
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys

app = Flask(__name__)

os.system("taskkill /im chrome.exe /f")

options = Options()
options.add_argument("--start-maximized")
options.add_argument("--remote-debugging-port=9222")
options.add_argument("--disable-dev-shm-using")
options.add_experimental_option("useAutomationExtension", False)
options.add_experimental_option("excludeSwitches", ["enable-automation"])
options.add_experimental_option("detach", True)
browser = webdriver.Chrome(options=options)
browser.set_window_size(1440, 1080)
browser.set_window_position(0, 0)
browser.get("https://www.linkedin.com/login/pt?fromSignIn=true&trk=guest_homepage-basic_nav-header-signin")


@app.route('/login')
def login():
    
    return ''

app.run(port=5000, host='localhost', debug=False)
