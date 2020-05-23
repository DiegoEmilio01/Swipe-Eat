# frozen_string_literal: true

# COMUNAS PRECARGADAS

@comuna1 = Comuna.create nombre: 'Las Condes', cuarentena: true
@comuna1.save
@comuna2 = Comuna.create nombre: 'Santiago', cuarentena: true
@comuna2.save
@comuna3 = Comuna.create nombre: 'Ñuñoa', cuarentena: true
@comuna3.save
@comuna4 = Comuna.create nombre: 'Temuco', cuarentena: false
@comuna4.save
@comuna5 = Comuna.create nombre: 'La Reina', cuarentena: true
@comuna5.save
@comuna6 = Comuna.create nombre: 'Providencia', cuarentena: false
@comuna6.save
@comuna7 = Comuna.create nombre: 'San Miguel', cuarentena: false
@comuna7.save

# GUSTOS PRECARGADOS

@gusto1 = Gusto.create nombre: 'Deporte', descripcion: 'Me gusta hacer deporte de vez en cuando y '\
                                                     'me agradaría hacerlo acompañado.'
@gusto1.save
@gusto2 = Gusto.create nombre: 'Cerveza', descripcion: 'Me gusta acompañar las citas que tendré '\
                                                     'con un buen shop de cerveza.'
@gusto2.save
@gusto3 = Gusto.create nombre: 'Ánime', descripcion: 'Me gusta ver ánime y estoy dispuesto '\
                                                   'a verlo acompañado.'
@gusto3.save
@gusto4 = Gusto.create nombre: 'Programar', descripcion: 'Soy computín y me gusta desarrollar '\
                                                       'código para entretenerme.'
@gusto4.save
@gusto5 = Gusto.create nombre: 'Alta gastronomía', descripcion: 'Prefiero ir a retaurantes '\
                                                              'de buena calidad.'
@gusto5.save

# ADMIN PRECARGADO

@admin = Admin.create nombre: 'Super Admin', email: 'admin@uc.cl', password: '123456'

# SWIPERS PRECARGADOS

@diego = Swiper.create nombre: 'Diego', email: 'diego@uc.cl', edad: 20, telefono: '+56912345678',
                       cumpleanos: '2020-06-14', direccion: 'Av Siempre Viva 742',
                       descripcion: 'Yo programé esta aplicación.', password: '123456'
@diego.save
@lucas = Swiper.create nombre: 'Lucas', email: 'lucas@uc.cl', edad: 20, telefono: '+56912345678',
                       cumpleanos: '2020-04-10', direccion: 'Av Siempre Viva 742',
                       descripcion: 'Yo programé esta aplicación.', password: '123456'
@lucas.save
@elias = Swiper.create nombre: 'Elias', email: 'elias@uc.cl', edad: 20, telefono: '+56912345678',
                       cumpleanos: '2020-05-21', direccion: 'Av Siempre Viva 742',
                       descripcion: 'Yo programé esta aplicación.', password: '123456'
@elias.save

# OWNER PRECARGADO

@owner1 = Owner.create nombre: 'Gordon Ramsay', email: 'gordon@uc.cl', password: '123456'
@owner1.save
@owner2 = Owner.create nombre: 'Colonel Sanders', email: 'coronel@uc.cl', password: '123456'
@owner2.save
@owner3 = Owner.create nombre: 'Ronald McDonald', email: 'mcdonald@uc.cl', password: '123456'
@owner3.save
