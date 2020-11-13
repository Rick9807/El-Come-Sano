@extends('layouts.blank')

<style>

  .weekdays {
    margin: 0;
    padding: 10px 0;
    background-color:#ddd;
  }

  .weekdays th {
    width: 13.6%;
    color: #666;
    text-align: center;
  }

  .days {
    padding: 10px 0;
    background: #eee;
    margin: 0;
  }

  .days td {
    list-style-type: none;
    width: 13.6%;
    text-align: center;
    margin-bottom: 5px;
    font-size:12px;
    color: #777;
  }
    
</style>

@section('contenido')

  <h1 class="mt-4">Dieta Actual</h1>

  <table style="width:100%">
    <tr class="weekdays">
      <th>Lunes</th>
      <th>Martes</th>
      <th>Miercoles</th>
      <th>Jueves</th>
      <th>Viernes</th>
      <th>Sabado</th>
      <th>Domingo</th>
    </tr>
    <tr class="days">
      <td>Cereal</td> 
      <td>Cereal</td> 
      <td>Cereal</td>  
      <td>Cereal</td> 
      <td>Cereal</td> 
      <td>Cereal</td> 
      <td>Cereal</td> 
    </tr>
    <tr class="days">
      <td>Hamburguesa</td> 
      <td>Tacos</td> 
      <td>Pollo</td> 
      <td>Carne Asada</td> 
      <td>Frijoles</td> 
      <td>Pizza</td> 
      <td>Pozole</td>
    </tr>
    <tr class="days">
      <td>Fruta</td> 
      <td>Fruta</td>
      <td>Fruta</td>
      <td>Fruta</td>
      <td>Fruta</td>
      <td>Fruta</td> 
      <td>Fruta</td>
    </tr>
  </table>
    
  <h1 class="mt-4">Generacion de dietas</h1>
  <div style="text-align:center;">
    <button class="btn btn-primary">Generar Nueva Dieta Basada En Mis Datos</button>
  </div>

  <h1 class="mt-4">Top platillos nuevos</h1>
  
  <div class="row">

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">2000 KCal</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">Hamburguesa</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
      

  </div>

<h1 class="mt-4">Ayuda Profesional</h1>

@endsection