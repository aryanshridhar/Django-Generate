word_1="${@:1:1}"
django-admin startproject $word_1
cd $word_1/
destination='django.contrib.staticfiles'
for i in ${@:2};do 
    temp=${i,,}
    echo -e 'Generating boiler for '$i'\n'
    python manage.py startapp $i
    cd $i/
    echo 'Building layout ...'
    echo 'Building urls.py ...'
    cp ../$word_1/urls.py .
    cp ../$word_1/urls.py urls.py
    echo 'Building forms.py ...'
    touch forms.py
    echo 'from django import forms' > forms.py
    echo 'Building serializers.py ...'
    echo 'from rest_framework import serializers' > serializers.py
    cd ../$word_1
    sed -i "/${destination}/a\\\t'$i.apps.${temp^}Config'," settings.py
    echo -e '\n'
    cd ..
done 

echo 'Done !'
