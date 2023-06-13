# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Actor(models.Model):
    nombre = models.CharField(max_length=100)
    def __str__(self) -> str:
            return f'{self.nombre}'
    class Meta:
        managed = False
        db_table = 'actor'


class Director(models.Model):
    nombre = models.CharField(max_length=100)
    def __str__(self) -> str:
        return f'{self.nombre}'
    class Meta:
        managed = False
        db_table = 'director'

class Pelicula(models.Model):
    titulo = models.CharField(max_length=100)
    duracion = models.IntegerField(blank=True, null=True)
    sinopsis = models.TextField(blank=True, null=True)
    director = models.ForeignKey(Director, models.DO_NOTHING)
    def __str__(self) -> str:
        return f'{self.titulo}'
    class Meta:
        managed = False
        db_table = 'pelicula'

class ActorPorPelicula(models.Model):
    actor = models.ForeignKey(Actor, models.DO_NOTHING)
    pelicula = models.ForeignKey(Pelicula, models.DO_NOTHING)
    def __str__(self) -> str:
        return f'{self.actor.nombre} - {self.pelicula.titulo}'
    class Meta:
        managed = False
        db_table = 'actor_por_pelicula'

class Sector(models.Model):
    nombre = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'sector'

class Sala(models.Model):
    nombre = models.CharField(max_length=100)
    sector = models.ForeignKey(Sector, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'sala'

class Funcion(models.Model):
    pelicula = models.ForeignKey(Pelicula, models.DO_NOTHING)
    sala = models.ForeignKey(Sala, models.DO_NOTHING)
    fecha = models.DateField()
    hora = models.TimeField()

    class Meta:
        managed = False
        db_table = 'funcion'

class Entrada(models.Model):
    funcion = models.ForeignKey(Funcion, models.DO_NOTHING)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    monto = models.DecimalField(max_digits=65535, decimal_places=65535)

    class Meta:
        managed = False
        db_table = 'entrada'

class TipoFuncion(models.Model):
    nombre = models.CharField(max_length=100)
    tarifa = models.DecimalField(max_digits=65535, decimal_places=65535)

    class Meta:
        managed = False
        db_table = 'tipo_funcion'
