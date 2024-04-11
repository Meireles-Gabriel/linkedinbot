import os
import time
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


@app.route('/login/<email>/<password>')
def login(email, password):
    element = browser.find_element(By.XPATH, "//input[@id='username']")
    element.click()
    ActionChains(browser).send_keys(email).perform()
    ActionChains(browser).send_keys(Keys.TAB).perform()
    ActionChains(browser).send_keys(password).perform()
    ActionChains(browser).send_keys(Keys.TAB).perform()
    ActionChains(browser).send_keys(Keys.TAB).perform()
    ActionChains(browser).send_keys(Keys.TAB).perform()
    ActionChains(browser).send_keys(Keys.ENTER).perform()
    return ''

@app.route('/search/<field>')
def search(field):
    element = browser.find_element(By.XPATH, "//input[@class='search-global-typeahead__input']")
    element.click()
    ActionChains(browser).send_keys(field).perform()
    ActionChains(browser).send_keys(Keys.ENTER).perform()
    time.sleep(5)
    element = browser.find_element(By.XPATH, "//button[text()='Pessoas']")
    element.click()
    time.sleep(2)

    return ''

@app.route('/send/<message>')
def send(message):
    try:    
        element = browser.find_element(By.XPATH, f"//span[@class='artdeco-button__text' and text()='Conectar']")
        element.click()
    except:
        try:
            ActionChains(browser).send_keys(Keys.END).perform()
            element = browser.find_element(By.XPATH, f"//span[@class='artdeco-button__text' and text()='Avançar']")
            element.click()
            time.sleep(3)
            return 'Next' 
        except:
            element = browser.find_element(By.XPATH, f"//span[@class='artdeco-button__text' and text()='Entendi']")
            element.click()
            time.sleep(2)
            return 'Popup Closed' 
    time.sleep(1)
    element = browser.find_element(By.XPATH, f"//span[@class='artdeco-button__text' and text()='Adicionar nota']")
    element.click()
    time.sleep(1)
    element = browser.find_element(By.XPATH, f"//textarea[@name='message']")
    element.click()
    time.sleep(1)
    ActionChains(browser).send_keys(message).perform()
    ActionChains(browser).send_keys(Keys.TAB).perform()
    ActionChains(browser).send_keys(Keys.TAB).perform()
    ActionChains(browser).send_keys(Keys.TAB).perform()
    ActionChains(browser).send_keys(Keys.ENTER).perform()
    time.sleep(2)
    return ''

@app.route('/home')
def home():
    browser.get('https://www.linkedin.com/feed/')
    return ''


app.run(port=5000, host='localhost', debug=False)
