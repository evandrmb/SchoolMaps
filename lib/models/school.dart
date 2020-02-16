import 'package:google_maps_flutter/google_maps_flutter.dart';

class School {
  String name;
  String adress;
  LatLng coords;
  String website;
  String callnumber;

  School({this.adress, this.coords, this.name, this.website, this.callnumber});
}

final List<School> theschools = [
  School(
    name: 'Instituto Dom Barreto',
    adress:
        'R. Gabriel Ferreira, 691N - Centro (Norte), Teresina - PI, 64000-250',
    website: 'dombarreto.g12.br',
    coords: LatLng(-5.083978, -42.814247),
    callnumber: '(86) 3228-8800',
  ),
  School(
    name: 'Grupo Educacional CEV - Unidade Frei Serafim',
    adress: 'Av. Frei Serafim, 3125 - Centro (Sul), Teresina - PI, 64000-020',
    website: 'grupocev.com',
    coords: LatLng(-5.083910, -42.799321),
    callnumber: '(86) 3133-7000',
  ),
  School(
    name: 'Grupo Educacional CEV - Unidade Kennedy',
    adress:
        'R. Dr. José Auto de Abreu, 2929 - Morada do Sol, Teresina - PI, 64055-260',
    website: 'grupocev.com',
    coords: LatLng(-5.072327, -42.771346),
    callnumber: '(86) 3133-7000',
  ),
  School(
    name: 'Diocesano',
    adress: 'R. Barroso, 363 - Centro (Sul), Teresina - PI, 64000-200',
    website: 'diocesano.g12.br',
    coords: LatLng(-5.094498, -42.812508),
    callnumber: '(86) 2107-4400',
  ),
  School(
    name: 'CSCJ - Colégio Sagrado Coração de Jesus( colégio das irmãs)',
    adress: 'Av. Frei Serafim, 1793 - Centro (Sul), Teresina - PI, 64000-020',
    website: 'cscj-pi.com.br',
    callnumber: '(86) 2106-5177',
    coords: LatLng(-5.088740, -42.809365),
  ),
];
