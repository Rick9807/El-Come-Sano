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

  <?php

    function buscar_platillo($calorias_restantes) {
      $arreglo = array();
      $precision = 0.05;
      while( count($arreglo) == 0 ){
        $min = $calorias_restantes * (1 - $precision) ;
        $max = $calorias_restantes * (1 + $precision) ;
        $arreglo = App\Models\Platillo::where([ ['plat_cal', '>', $min],['plat_cal', '<', $max], ])->get();
        $precision += $precision;
        if($precision == 1.05 ){ break; }
      }
      $ran = rand ( 0 , count($arreglo)-1 );
      return $arreglo[$ran];
    }

    $calorias_dia = 1500;
    $arreglo;

    for($dia = 0; $dia < 7; $dia++){
      $cal_res = $calorias_dia / 3;
      for($com = 0; $com < 3; $com++){
        $arreglo[$dia][$com] = buscar_platillo($cal_res);

        if ( (3-($com+1)) != 0 ){
          $cal_res = ($calorias_dia - $arreglo[$dia][$com]->plat_cal) / (3-($com+1));
        }
      }
    }


  ?>

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
      <?php
      for($i = 0; $i < 7; $i++){
        echo "<td>".$arreglo[$i][0]->plat_nombre."</td>";
      }
      ?>
    </tr>
    <tr class="days">
      <?php
      for($i = 0; $i < 7; $i++){
        echo "<td>".$arreglo[$i][1]->plat_nombre."</td>";
      }
      ?>
    </tr>
    <tr class="days">
      <?php
      for($i = 0; $i < 7; $i++){
        echo "<td>".$arreglo[$i][2]->plat_nombre."</td>";
      }
      ?>
    </tr>
  </table>
    
  <br>
  
  <div style="text-align:center;">
    <button class="btn btn-primary">Generar Nueva Dieta Basada En Mis Datos</button>
  </div>

  <h1 class="mt-4">Top platillos nuevos</h1>
  
  <div class="row">

  @foreach ($platillos as $platillo)
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-primary shadow h-100 py-2">
          <div class="card-body">
              <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{ $platillo->plat_cal }} Calorias</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $platillo->plat_nombre }}</div>
                  </div>
              </div>
          </div>
      </div>
    </div>
  @endforeach

  </div>

<h1 class="mt-4">Ayuda Profesional</h1>

@endsection

@section('datosTMB')
<div class="sidebar-heading">
        Datos
      </div>

      <!-- Agregar edad -->
      <!--
      <form class="form-inline mr-auto w-100 navbar-search">
-->
        <br>
        <div class="input-group-prepened">
          <label for="edad_side" class="text-light mr-1">Edad</label>
          <input id="edadCalculo" type="number" class="form-control-sm bg-light border-0 small col-sm-9" placeholder="Edad..." name="edad_side">
          <label for="peso_side" class="text-light mr-1">Peso</label>
          <input id="pesoCalculo" type="number" class="form-control-sm bg-light border-0 small col-sm-9" placeholder="Peso..." name="peso_side">
          <br>
          <div class="form-check">
            <input type="radio" name="sexo" id="masculino" value="masculino" class="form-check-input">
            <label for="masculino" class="text-light mr-1 form-check-label">Masculino</label>
          </div>
          <div class="form-check">
            <input type="radio" name="sexo" id="femenino" value="femenino" class="form-check-input">
            <label for="femenino" class="text-light mr-1 form-check-label">Femenino</label>
          </div>
        </div>
        <div>
          <button id="btnCalculo" class="btn btn-primary">Calcular</button>
        </div>
      <!--
      </form>
-->
      <hr class="sidebar-divider d-none d-md-block">

      <h6 class="text-light mr-1">Calorias para mantener peso</h6>
      <div id="tmbCalculo"></div>
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <script type="text/javascript" src="{{ URL::asset('js/sidebarCalculate.js') }}"></script>
@endsection