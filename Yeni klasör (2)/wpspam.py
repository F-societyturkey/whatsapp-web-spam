from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Firefox()
driver.get('https://web.whatsapp.com/')

print("giriliyor...\n")

name = input("kurban'ın ismi:")
count = int(input("mesaj sayısı:"))
msg = input("gönderilecek mesaj:")

user = driver.find_element_by_xpath('//span[@title = "{}"]'.format(name))
user.click()

msgBox = driver.find_element_by_xpath(
    '//*[@id="main"]/footer/div[1]/div/span[2]/div/div[2]/div[1]/div/div[2]')
for i in range(count):
    msgBox.send_keys(msg)
    msgBox.send_keys(Keys.ENTER)
