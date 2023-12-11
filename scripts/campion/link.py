import sys
import requests
from bs4 import BeautifulSoup

def linkProblema(numeProblema):
  url = "http://campion.edu.ro/arhiva/index.php?page=search&action=searched&filtercriteria=all&query=" + numeProblema + "&x=0&y=0&overall_all=yes&problems_keyword=yes&papers_keyword=yes&seds_keyword=yes&locations_name=yes&authors_first_name=yes&teachers_first_name=yes&competitors_first_name=yes&problems_name=yes&papers_name=yes&seds_name=yes&locations_year=yes&authors_last_name=yes&teachers_last_name=yes&competitors_last_name=yes&problems_author=yes&papers_author=yes&seds_author=yes&competitors_school=yes&problems_teacher=yes&papers_teacher=yes&seds_teacher=yes&competitors_city=yes"
  response = requests.get(url)
  if response.status_code == 200:
    soup = BeautifulSoup(response.text, "html.parser")
    a = soup.find("a", string=numeProblema)
    if a and a.has_attr("href"):
      return "http://campion.edu.ro/arhiva/" + a.get("href")
  return ""

print(linkProblema(sys.argv[1]))
