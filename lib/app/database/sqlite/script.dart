final createTable = """ 
  CREATE TABLE contact(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL
  )
""";

final insert1 = """
INSERT INTO contact(nome,telefone,email,url_avatar)
VALUES('Pietro', '(11)9 8745-656', 'pietro@gmail.com', 'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png')
""";

final insert2 = """
INSERT INTO contact(nome,telefone,email,url_avatar)
VALUES('Maitê', '(11)9 9632-8578', 'maete@gmail.com', 'https://cdn.pixabay.com/photo/2021/02/19/08/54/woman-6029587_960_720.jpg')
""";

final insert3 = """
INSERT INTO contact(nome,telefone,email,url_avatar)
VALUES('Hortência', '(11)9 9595-7889', 'hortencia@gmail.com', 'https://cdn.pixabay.com/photo/2021/02/27/09/55/girl-6054102_960_720.jpg')
""";
