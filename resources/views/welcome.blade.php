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
        $precision += 0.05;
        if($precision > 1 ){ return NULL; }
      }
      $ran = rand ( 0 , count($arreglo)-1 );
      return $arreglo[$ran];
    }
    if(!isset($_COOKIE["tmb"])) {
      setcookie('tmb', '1500');
      $_COOKIE['tmb'] = '1500';
    }


    $calorias = $_COOKIE["tmb"];
    
    $calorias_dia = floatval($calorias);
    
    $arreglo;

    //Rellena el arreglo para los 7 dias de la semana
    for($dia = 0; $dia < 7; $dia++){

      // cal_res es la cantidad ideal de calorias por comida = (calorias recomendadas por dia / 3)
      $cal_res = $calorias_dia / 3;

      $cal_consumidas = 0;

      //Rellena el arreglo para las 3 comidas del dia
      for($com = 0; $com < 3; $com++){

        //Asignamos una platillo, al dia y comida correspondiente
        $arreglo[$dia][$com] = buscar_platillo($cal_res);

        //Restamos las calorias que equivale el platillo seleccionado
        if ( $arreglo[$dia][$com] ){
          $cal_consumidas += $arreglo[$dia][$com]->plat_cal;
          
          if( 2-$com != 0 ){
            $cal_res = ($calorias_dia - $arreglo[$dia][$com]->plat_cal) / 2-$com;
          }
        }
      }

      //Agregamos al arreglo el total de calorias consumidas este dia
      $arreglo[$dia][3] = $cal_consumidas;
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
        if($arreglo[$i][0]){
          echo "<td>".$arreglo[$i][0]->plat_nombre."</td>";
        }
        else{
          echo "<td>Sin Platillos</td>";
        }
      }
      ?>
    </tr>
    <tr class="days">
      <?php
      for($i = 0; $i < 7; $i++){
        if($arreglo[$i][1]){
          echo "<td>".$arreglo[$i][1]->plat_nombre."</td>";
        }
        else{
          echo "<td>Sin Platillos</td>";
        }
      }
      ?>
    </tr>
    <tr class="days">
      <?php
      for($i = 0; $i < 7; $i++){
        if($arreglo[$i][2]){
          echo "<td>".$arreglo[$i][2]->plat_nombre."</td>";
        }
        else{
          echo "<td>Sin Platillos</td>";
        }
      }
      ?>
    </tr>

    <tr class="days">
      <?php
      for($i = 0; $i < 7; $i++){
      
        echo "<td>Total: ".$arreglo[$i][3]." calorias</td>";
      
      }
      ?>
    </tr>

  </table>
    
  <br>
  
  <div style="text-align:center;">
    <button class="btn btn-primary">Generar Nueva Dieta Basada En Mis Datos</button>

    <button class="btn btn-primary">Guardar Esta Dieta Como Predeterminada</button>
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
        
        <br>

        <div class="input-group-prepened">
          <label for="edad_side" class="text-light mr-1">Edad</label>
          <input id="edadCalculo" type="number" class="form-control-sm bg-light border-0 small col-sm-9" placeholder="Edad..." name="edad_side">
          <label for="peso_side" class="text-light mr-1">Peso</label>
          <input id="pesoCalculo" type="number" class="form-control-sm bg-light border-0 small col-sm-9" placeholder="Peso..." name="peso_side">
          <br>
          <br>
          <div class="form-check">
            <input type="radio" name="sexo" id="masculino" value="masculino" class="form-check-input">
            <i class="fas fa-male"></i> <label for="masculino" class="text-light mr-1 form-check-label">Masculino</label> 
          </div>
          <div class="form-check">
            <input type="radio" name="sexo" id="femenino" value="femenino" class="form-check-input">
            <i class="fas fa-female"></i> <label for="femenino" class="text-light mr-1 form-check-label">Femenino</label>
          </div>
          <br>
          <!-- opciones para la actividad fisica -->
          <h7 class="text-light mr-1">Tipo de actividad fisica:</h7>
          <div class="form-check">
            <input type="radio" name="actividad" id="actividadMuyLigera" value="actividadMuyLigera" class="form-check-input">
            <label for="actividadMuyLigera" class="text-light mr-1 form-check-label small">Actividad muy ligera</label>
          </div>
          <div class="form-check">
            <input type="radio" name="actividad" id="actividadLigera" value="actividadLigera" class="form-check-input">
            <label for="actividadLigera" class="text-light mr-1 form-check-label small">Actividad ligera</label>
          </div>
          <div class="form-check">
            <input type="radio" name="actividad" id="actividadModerada" value="actividadModerada" class="form-check-input">
            <label for="actividadModerada" class="text-light mr-1 form-check-label small">Actividad moderada</label>
          </div>
          <div class="form-check">
            <input type="radio" name="actividad" id="actividadActiva" value="actividadActiva" class="form-check-input">
            <label for="actividadActiva" class="text-light mr-1 form-check-label small">Actividad activa</label>
          </div>
          <div class="form-check">
            <input type="radio" name="actividad" id="actividadMuyActiva" value="actividadMuyActiva" class="form-check-input">
            <label for="actividadMuyActiva" class="text-light mr-1 form-check-label small">Actividad muy activa</label>
          </div>

        </div>
        <div>
        <center>
          <button id="btnCalculo" class="boton btn btn-primary">Calcular</button>
          </center>
        </div>
      <br>
      <hr class="sidebar-divider d-none d-md-block">
      <!--
      <h6 class="text-light mr-1">Calorias para mantener peso</h6>
      <div id="tmbCalculo"></div>
      -->
      <!-- Divider -->
      <!--
      <hr class="sidebar-divider d-none d-md-block">
      -->
      <script type="text/javascript" src="{{ URL::asset('js/sidebarCalculate.js') }}"></script>
@endsection

@section('admin')
    <a class="dropdown-item" href="{{ route('platillos.index') }}">
        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
        Admin
    </a>
    <div class="dropdown-divider"></div>
@endsection