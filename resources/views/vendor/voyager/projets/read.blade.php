@extends('voyager::master')

@section('page_title', __('voyager::generic.view').' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i> {{ __('voyager::generic.viewing') }} {{ ucfirst($dataType->getTranslatedAttribute('display_name_singular')) }} &nbsp;

        @can('edit', $dataTypeContent)
            <a href="{{ route('voyager.'.$dataType->slug.'.edit', $dataTypeContent->getKey()) }}" class="btn btn-info">
                <span class="glyphicon glyphicon-pencil"></span>&nbsp;
                {{ __('voyager::generic.edit') }}
            </a>
        @endcan
        @can('delete', $dataTypeContent)
            @if($isSoftDeleted)
                <a href="{{ route('voyager.'.$dataType->slug.'.restore', $dataTypeContent->getKey()) }}" title="{{ __('voyager::generic.restore') }}" class="btn btn-default restore" data-id="{{ $dataTypeContent->getKey() }}" id="restore-{{ $dataTypeContent->getKey() }}">
                    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.restore') }}</span>
                </a>
            @else
                <a href="javascript:;" title="{{ __('voyager::generic.delete') }}" class="btn btn-danger delete" data-id="{{ $dataTypeContent->getKey() }}" id="delete-{{ $dataTypeContent->getKey() }}">
                    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.delete') }}</span>
                </a>
            @endif
        @endcan
        @can('browse', $dataTypeContent)
        <a href="{{ route('voyager.'.$dataType->slug.'.index') }}" class="btn btn-warning">
            <span class="glyphicon glyphicon-list"></span>&nbsp;
            {{ __('voyager::generic.return_to_list') }}
        </a>
        @endcan
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered" style="padding-bottom:5px;">
                    <!-- form start -->
                    @foreach($dataType->readRows as $row)
                        @php
                        if ($dataTypeContent->{$row->field.'_read'}) {
                            $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_read'};
                        }
                        @endphp
                        <div class="panel-heading" style="border-bottom:0;">
                            <h3 class="panel-title">{{ $row->getTranslatedAttribute('display_name') }}</h3>
                        </div>

                        <div class="panel-body" style="padding-top:0;">
                            @if (isset($row->details->view))
                                @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => 'read', 'view' => 'read', 'options' => $row->details])
                            @elseif($row->type == "image")
                                <img class="img-responsive"
                                     src="{{ filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL) ? $dataTypeContent->{$row->field} : Voyager::image($dataTypeContent->{$row->field}) }}">
                            @elseif($row->type == 'multiple_images')
                                @if(json_decode($dataTypeContent->{$row->field}))
                                    @foreach(json_decode($dataTypeContent->{$row->field}) as $file)
                                        <img class="img-responsive"
                                             src="{{ filter_var($file, FILTER_VALIDATE_URL) ? $file : Voyager::image($file) }}">
                                    @endforeach
                                @else
                                    <img class="img-responsive"
                                         src="{{ filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL) ? $dataTypeContent->{$row->field} : Voyager::image($dataTypeContent->{$row->field}) }}">
                                @endif
                            @elseif($row->type == 'relationship')
                                 @include('voyager::formfields.relationship', ['view' => 'read', 'options' => $row->details])
                            @elseif($row->type == 'select_dropdown' && property_exists($row->details, 'options') &&
                                    !empty($row->details->options->{$dataTypeContent->{$row->field}})
                            )
                                <?php echo $row->details->options->{$dataTypeContent->{$row->field}};?>
                            @elseif($row->type == 'select_multiple')
                                @if(property_exists($row->details, 'relationship'))

                                    @foreach(json_decode($dataTypeContent->{$row->field}) as $item)
                                        {{ $item->{$row->field}  }}
                                    @endforeach

                                @elseif(property_exists($row->details, 'options'))
                                    @if (!empty(json_decode($dataTypeContent->{$row->field})))
                                        @foreach(json_decode($dataTypeContent->{$row->field}) as $item)
                                            @if (@$row->details->options->{$item})
                                                {{ $row->details->options->{$item} . (!$loop->last ? ', ' : '') }}
                                            @endif
                                        @endforeach
                                    @else
                                        {{ __('voyager::generic.none') }}
                                    @endif
                                @endif
                            @elseif($row->type == 'date' || $row->type == 'timestamp')
                                @if ( property_exists($row->details, 'format') && !is_null($dataTypeContent->{$row->field}) )
                                    {{ \Carbon\Carbon::parse($dataTypeContent->{$row->field})->formatLocalized($row->details->format) }}
                                @else
                                    {{ $dataTypeContent->{$row->field} }}
                                @endif
                            @elseif($row->type == 'checkbox')
                                @if(property_exists($row->details, 'on') && property_exists($row->details, 'off'))
                                    @if($dataTypeContent->{$row->field})
                                    <span class="label label-info">{{ $row->details->on }}</span>
                                    @else
                                    <span class="label label-primary">{{ $row->details->off }}</span>
                                    @endif
                                @else
                                {{ $dataTypeContent->{$row->field} }}
                                @endif
                            @elseif($row->type == 'color')
                                <span class="badge badge-lg" style="background-color: {{ $dataTypeContent->{$row->field} }}">{{ $dataTypeContent->{$row->field} }}</span>
                            @elseif($row->type == 'coordinates')
                                @include('voyager::partials.coordinates')
                            @elseif($row->type == 'rich_text_box')
                                @include('voyager::multilingual.input-hidden-bread-read')
                                {!! $dataTypeContent->{$row->field} !!}
                            @elseif($row->type == 'file')
                                @if(json_decode($dataTypeContent->{$row->field}))
                                    @foreach(json_decode($dataTypeContent->{$row->field}) as $file)
                                        <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($file->download_link) ?: '' }}">
                                            {{ $file->original_name ?: '' }}
                                        </a>
                                        <br/>
                                    @endforeach
                                @else
                                    <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($row->field) ?: '' }}">
                                        {{ __('voyager::generic.download') }}
                                    </a>
                                @endif
                            @else
                                @include('voyager::multilingual.input-hidden-bread-read')
                                <p>{{ $dataTypeContent->{$row->field} }}</p>
                            @endif
                        </div><!-- panel-body -->
                        @if(!$loop->last)
                            <hr style="margin:0;">
                        @endif
                    @endforeach

                </div>
            </div>
        </div>
    </div>

    {{-- Single delete modal --}}
    <div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-trash"></i> {{ __('voyager::generic.delete_question') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}?</h4>
                </div>
                <div class="modal-footer">
                    <form action="{{ route('voyager.'.$dataType->slug.'.index') }}" id="delete_form" method="POST">
                        {{ method_field('DELETE') }}
                        {{ csrf_field() }}
                        <input type="submit" class="btn btn-danger pull-right delete-confirm"
                               value="{{ __('voyager::generic.delete_confirm') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}">
                    </form>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->



    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <h2>Log list</h2>
        <div>@php echo count($dataTypeContent_log) @endphp log(s) found(s)</div>
        @php
        if (count($dataTypeContent_log) > 0) {
        @endphp
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-bordered">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table id="dataTable" class="table table-hover">
                                    <thead>
                                        <tr>
                                           
                                            @foreach($dataType_log->browseRows as $row)
                                                @php
                                                if ($row->display_name != 'Projet') {
                                                @endphp
                                                    <th>
                                                        {{ $row->getTranslatedAttribute('display_name') }}
                                                    </th>
                                                @php
                                                }
                                                @endphp
                                            @endforeach
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($dataTypeContent_log as $data)
                                        <tr>
                                          
                                            @foreach($dataType_log->browseRows as $row)
                                                @php
                                                if ($data->{$row->field.'_browse'}) {
                                                    $data->{$row->field} = $data->{$row->field.'_browse'};
                                                }
                                                if ($row->display_name != 'Projet') {
                                                @endphp
                                                    <td>
                                                        @if (isset($row->details->view))
                                                            @include($row->details->view, ['row' => $row, 'dataType' => $dataType_log, 'dataTypeContent' => $dataTypeContent_log, 'content' => $data->{$row->field}, 'action' => 'browse', 'view' => 'browse', 'options' => $row->details])
                                                        @elseif($row->type == 'image')
                                                            <img src="@if( !filter_var($data->{$row->field}, FILTER_VALIDATE_URL)){{ Voyager::image( $data->{$row->field} ) }}@else{{ $data->{$row->field} }}@endif" style="width:100px">
                                                        @elseif($row->type == 'relationship')
                                                            @include('voyager::formfields.relationship', ['view' => 'browse','options' => $row->details])
                                                        @elseif($row->type == 'select_multiple')
                                                            @if(property_exists($row->details, 'relationship'))

                                                                @foreach($data->{$row->field} as $item)
                                                                    {{ $item->{$row->field} }}
                                                                @endforeach

                                                            @elseif(property_exists($row->details, 'options'))
                                                                @if (!empty(json_decode($data->{$row->field})))
                                                                    @foreach(json_decode($data->{$row->field}) as $item)
                                                                        @if (@$row->details->options->{$item})
                                                                            {{ $row->details->options->{$item} . (!$loop->last ? ', ' : '') }}
                                                                        @endif
                                                                    @endforeach
                                                                @else
                                                                    {{ __('voyager::generic.none') }}
                                                                @endif
                                                            @endif

                                                            @elseif($row->type == 'multiple_checkbox' && property_exists($row->details, 'options'))
                                                                @if (@count(json_decode($data->{$row->field})) > 0)
                                                                    @foreach(json_decode($data->{$row->field}) as $item)
                                                                        @if (@$row->details->options->{$item})
                                                                            {{ $row->details->options->{$item} . (!$loop->last ? ', ' : '') }}
                                                                        @endif
                                                                    @endforeach
                                                                @else
                                                                    {{ __('voyager::generic.none') }}
                                                                @endif

                                                        @elseif(($row->type == 'select_dropdown' || $row->type == 'radio_btn') && property_exists($row->details, 'options'))

                                                            {!! $row->details->options->{$data->{$row->field}} ?? '' !!}

                                                        @elseif($row->type == 'date' || $row->type == 'timestamp')
                                                            @if ( property_exists($row->details, 'format') && !is_null($data->{$row->field}) )
                                                                {{ \Carbon\Carbon::parse($data->{$row->field})->formatLocalized($row->details->format) }}
                                                            @else
                                                                {{ $data->{$row->field} }}
                                                            @endif
                                                        @elseif($row->type == 'checkbox')
                                                            @if(property_exists($row->details, 'on') && property_exists($row->details, 'off'))
                                                                @if($data->{$row->field})
                                                                    <span class="label label-info">{{ $row->details->on }}</span>
                                                                @else
                                                                    <span class="label label-primary">{{ $row->details->off }}</span>
                                                                @endif
                                                            @else
                                                            {{ $data->{$row->field} }}
                                                            @endif
                                                        @elseif($row->type == 'color')
                                                            <span class="badge badge-lg" style="background-color: {{ $data->{$row->field} }}">{{ $data->{$row->field} }}</span>
                                                        @elseif($row->type == 'text')
                                                            @include('voyager::multilingual.input-hidden-bread-browse')
                                                            <div>{{ mb_strlen( $data->{$row->field} ) > 200 ? mb_substr($data->{$row->field}, 0, 200) . ' ...' : $data->{$row->field} }}</div>
                                                        @elseif($row->type == 'text_area')
                                                            @include('voyager::multilingual.input-hidden-bread-browse')
                                                            <div>{{ mb_strlen( $data->{$row->field} ) > 200 ? mb_substr($data->{$row->field}, 0, 200) . ' ...' : $data->{$row->field} }}</div>
                                                        @elseif($row->type == 'file' && !empty($data->{$row->field}) )
                                                            @include('voyager::multilingual.input-hidden-bread-browse')
                                                            @if(json_decode($data->{$row->field}) !== null)
                                                                @foreach(json_decode($data->{$row->field}) as $file)
                                                                    <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($file->download_link) ?: '' }}" target="_blank">
                                                                        {{ $file->original_name ?: '' }}
                                                                    </a>
                                                                    <br/>
                                                                @endforeach
                                                            @else
                                                                <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($data->{$row->field}) }}" target="_blank">
                                                                    Download
                                                                </a>
                                                            @endif
                                                        @elseif($row->type == 'rich_text_box')
                                                            @include('voyager::multilingual.input-hidden-bread-browse')
                                                            <div>{{ mb_strlen( strip_tags($data->{$row->field}, '<b><i><u>') ) > 200 ? mb_substr(strip_tags($data->{$row->field}, '<b><i><u>'), 0, 200) . ' ...' : strip_tags($data->{$row->field}, '<b><i><u>') }}</div>
                                                        @elseif($row->type == 'coordinates')
                                                            @include('voyager::partials.coordinates-static-image')
                                                        @elseif($row->type == 'multiple_images')
                                                            @php $images = json_decode($data->{$row->field}); @endphp
                                                            @if($images)
                                                                @php $images = array_slice($images, 0, 3); @endphp
                                                                @foreach($images as $image)
                                                                    <img src="@if( !filter_var($image, FILTER_VALIDATE_URL)){{ Voyager::image( $image ) }}@else{{ $image }}@endif" style="width:50px">
                                                                @endforeach
                                                            @endif
                                                        @elseif($row->type == 'media_picker')
                                                            @php
                                                                if (is_array($data->{$row->field})) {
                                                                    $files = $data->{$row->field};
                                                                } else {
                                                                    $files = json_decode($data->{$row->field});
                                                                }
                                                            @endphp
                                                            @if ($files)
                                                                @if (property_exists($row->details, 'show_as_images') && $row->details->show_as_images)
                                                                    @foreach (array_slice($files, 0, 3) as $file)
                                                                    <img src="@if( !filter_var($file, FILTER_VALIDATE_URL)){{ Voyager::image( $file ) }}@else{{ $file }}@endif" style="width:50px">
                                                                    @endforeach
                                                                @else
                                                                    <ul>
                                                                    @foreach (array_slice($files, 0, 3) as $file)
                                                                        <li>{{ $file }}</li>
                                                                    @endforeach
                                                                    </ul>
                                                                @endif
                                                                @if (count($files) > 3)
                                                                    {{ __('voyager::media.files_more', ['count' => (count($files) - 3)]) }}
                                                                @endif
                                                            @elseif (is_array($files) && count($files) == 0)
                                                                {{ trans_choice('voyager::media.files', 0) }}
                                                            @elseif ($data->{$row->field} != '')
                                                                @if (property_exists($row->details, 'show_as_images') && $row->details->show_as_images)
                                                                    <img src="@if( !filter_var($data->{$row->field}, FILTER_VALIDATE_URL)){{ Voyager::image( $data->{$row->field} ) }}@else{{ $data->{$row->field} }}@endif" style="width:50px">
                                                                @else
                                                                    {{ $data->{$row->field} }}
                                                                @endif
                                                            @else
                                                                {{ trans_choice('voyager::media.files', 0) }}
                                                            @endif
                                                        @else
                                                            @include('voyager::multilingual.input-hidden-bread-browse')
                                                            <span>{{ $data->{$row->field} }}</span>
                                                        @endif
                                                    </td>
                                                @php
                                                }
                                                @endphp
                                            @endforeach
                                            
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @php
        }else{
            @endphp
            <div>No log on this project</div>
            @php
        }
        @endphp
    </div>
@stop

@section('javascript')
    @if ($isModelTranslatable)
        <script>
            $(document).ready(function () {
                $('.side-body').multilingual();
            });
        </script>
    @endif
    <script>
        var deleteFormAction;
        $('.delete').on('click', function (e) {
            var form = $('#delete_form')[0];

            if (!deleteFormAction) {
                // Save form action initial value
                deleteFormAction = form.action;
            }

            form.action = deleteFormAction.match(/\/[0-9]+$/)
                ? deleteFormAction.replace(/([0-9]+$)/, $(this).data('id'))
                : deleteFormAction + '/' + $(this).data('id');

            $('#delete_modal').modal('show');
        });

    </script>
@stop
