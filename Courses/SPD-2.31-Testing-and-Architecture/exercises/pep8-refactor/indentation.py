# by Kami Bigdely
# Indentation
def write_to_db():
   print('person info are written into db.')
    
    
def set_person_info(first_name, last_name, gender, date_of_birth, photo, nationality, place_of_birth):
    if not first_name:
      print('first name is empty.') 
    if not last_name:
      print('last name is empty.')
    # ...    
    write_to_db()

photo_path = "https://en.wikipedia.org/wiki/Tim_Hunt#/media/File:Tim_Hunt_at_UCSF_05_2009_(4).jpg"
set_person_info('Tim', 'Hunt', 'male','19 February 1943', photo_path, 'Uited Kingdom', 'Neston, Cheshire, England')