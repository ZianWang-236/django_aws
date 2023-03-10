# Generated by Django 4.1.3 on 2022-12-09 19:42

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myadmin', '0002_category_shop'),
    ]

    operations = [
        migrations.CreateModel(
            name='Member',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nickname', models.CharField(max_length=50)),
                ('avatar', models.CharField(max_length=255)),
                ('mobile', models.CharField(max_length=50)),
                ('status', models.IntegerField(default=1)),
                ('create_at', models.DateTimeField(default=datetime.datetime.now)),
                ('update_at', models.DateTimeField(default=datetime.datetime.now)),
            ],
            options={
                'db_table': 'member',
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('shop_id', models.IntegerField()),
                ('category_id', models.IntegerField()),
                ('cover_pic', models.CharField(max_length=50)),
                ('name', models.CharField(max_length=50)),
                ('price', models.FloatField()),
                ('status', models.IntegerField(default=1)),
                ('create_at', models.DateTimeField(default=datetime.datetime.now)),
                ('update_at', models.DateTimeField(default=datetime.datetime.now)),
            ],
            options={
                'db_table': 'product',
            },
        ),
    ]
