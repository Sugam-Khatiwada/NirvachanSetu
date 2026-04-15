import urllib.request
headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'}
urls = [
    ('candidate1.jpg', 'https://upload.wikimedia.org/wikipedia/commons/7/74/Pushpa_Kamal_Dahal_%28Prachanda%29.jpg'),
    ('candidate2.jpg', 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Balen_Shah.jpg'),
    ('candidate3.jpg', 'https://upload.wikimedia.org/wikipedia/commons/8/87/K_P_Sharma_Oli_%282018%29.jpg'),
    ('candidate4.jpg', 'https://upload.wikimedia.org/wikipedia/commons/5/52/Harka_Sampang_Rai.jpg')
]
for name, url in urls:
    req = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(req) as response, open(name, 'wb') as out_file:
        out_file.write(response.read())
