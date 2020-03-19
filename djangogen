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
    echo 'Building .py files ..'
    cp ../$word_1/urls.py .
    touch forms.py
    echo 'Building API files ...'
    touch serializers.py
    echo 'Building directories  ...'
    mkdir -p templates/${i}
    mkdir -p static/${i}

    echo -e 'from django import forms\n\n#Create your forms here' > forms.py
    echo -e 'from rest_framework import serializers\n\n#Create your Api here' > serializers.py
    cd ../$word_1
    sed -i "/${destination}/a\\\t'$i.apps.${temp^}Config'," settings.py
    echo -e '\n'
    cd ..
done 

echo 'Done !'
