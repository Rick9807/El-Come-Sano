
@extends('layouts.table')

@section('titulo')
    <h1>Platillo</h1>
    <a href={{ action([\App\Http\Controllers\PlatilloController::class, 'index']) }} class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Regresar</a>
    <a href="{{ route('platillos.edit', [$platillo->id]) }}" class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Editar platillo</a>
    
    <form action="{{ route('platillos.destroy', [$platillo]) }}", method='POST' style='display:inline-block'>
        @method('DELETE')
        @csrf
        <button type="submit" class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Eliminar</button>
    </form>
@endsection

@section('tabla_cabecera')
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Calorias</th>
            <th>Azucares</th>
            <th>Descripcion</th>
            <th>Vegano</th>
            <th>Carbohidratos</th>
            <th>Colesterol</th>
            <th>Ingredientes</th>
        </tr>
@endsection

@section('tabla_contenido')
        <tr>
            <td>{{ $platillo->id }}</td>
            <td>{{ $platillo->plat_nombre }}</td>
            <td>{{ $platillo->plat_cal }}</td>
            <td>{{ $platillo->plat_azucares }}</td>
            <td>{{ $platillo->plat_desc }}</td>
            <td>{{ $platillo->plat_vegano }}</td>
            <td>{{ $platillo->plat_carbohidratos }}</td>
            <td>{{ $platillo->plat_colesterol }}</td>
            <td>
                @foreach ($platillo->ingredientes as $ingrediente)
                <a href="/ingredientes/{{$ingrediente->id}}"> {{ $ingrediente->ingre_nombre }}</a> <br>
                @endforeach
            </td>
        </tr>
@endsection



@section('tabla_extra')
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">
            <h1>Consejos</h1>
            <a onclick='openForm()' class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Añadir Consejo</a>

            <style>
                * {box-sizing: border-box;}
                /* The popup form - hidden by default */
                .form-popup {
                display: none;
                position: fixed;
                top: 50%;
                right: center;
                border: 3px solid #f1f1f1;
                z-index: 9;
                }

                /* Add styles to the form container */
                .form-container {
                max-width: 300px;
                padding: 10px;
                background-color: white;
                }

                /* Full-width input fields */
                .form-container input[type=text], .form-container input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
                }
            </style>

            <div class="form-popup" id="myForm">
            <form action="{{ route('consejos.store') }}" method="POST" class="form-container" id="editableform">
                <h1>Consejo</h1>
                @csrf
                <input type="hidden" value="{{ $platillo->id }}" name="platillo_id" />

                <label for="cons_contenido"><b>Contenido</b></label>
                <input type="text" placeholder="Ingresa el Consejo" name="cons_contenido" required>

                <button type="submit" class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm' style="width:49%;" id="subform">Registrar</button>
                <button type="button" class='d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm' style="width:49%;" onclick="closeForm()">Cancelar</button>
            </form>
            </div>

            <script>
            function openForm() {
            document.getElementById("myForm").style.display = "block";
            }

            function closeForm() {
            document.getElementById("myForm").style.display = "none";
            }
            </script>

        </h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Consejo</th>
                    <th>Eliminar</th>
                    <th>Editar</th>
                </tr>
                </thead>
                <!--<tfoot>
                @yield('tabla_cabecera')
                </tfoot>-->
                <tbody>
                    <tr>
                        @foreach ($platillo->consejo as $consejo)
                            <tr>
                                <td style="width:5%;"> {{ $consejo->id }} </td>   
                                <td style="width:75%;"> {{ $consejo->cons_contenido }} </td>
                                <td style="width:10%;"> 
                                    <form action="{{ route('consejos.destroy', [$consejo]) }}", method='POST'>
                                        @method('DELETE')
                                        @csrf
                                        <button class='d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm' type="submit">Eliminar</button>
                                    </form>
                                </td>
                                <td style="width:10%;">
                                    <a  class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Editar Consejo</a>
                                </td>
                            </tr>   
                        @endforeach
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

@section('admin')
    <a class="dropdown-item" href="{{ route('platillos.index') }}">
        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
        Admin
    </a>
    <div class="dropdown-divider"></div>
@endsection