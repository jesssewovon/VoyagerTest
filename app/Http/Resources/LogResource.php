<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

use App\Http\Resources\ProjetResource;

class LogResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //return parent::toArray($request);
        return [
            'id' => $this->id,
            'message' => $this->message,
            'type' => $this->type=='option1'?'Info':($this->type=='option2'?'Erreur':'Warning'),
            'date heure' => $this->date_heure,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'projet' => new ProjetResource($this->projet),
        ];
    }
}
