import smtplib
from email.message import EmailMessage
def sendmail(to,subject,body):
    server=smtplib.SMTP_SSL('smtp.gmail.com',465)
    server.login('panchakarlaprabhathkumar794@gmail.com','mzxr msrr ccbl spkd')
    msg=EmailMessage()
    msg['From']='panchakarlaprabhathkumar794@gmail.com'
    msg['To']=to
    msg['Subject']=subject
    msg.set_content(body)
    server.send_message(msg)
    server.quit()