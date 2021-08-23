var csrfToken = $('meta[name=csrf-token]').attr('content');

//funciones para mostrar tooltip text
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});
$(function () { 
    $("[data-toggle='popover']").popover(); 
});
//funciones ajax que asigna evaluadores
function asignacion(rfc,instituto) {
    var solicitud = $('input[name=fksol]').val();
    krajeeDialog.confirm("Está por generarse los registros para este evaluador, está seguro de continuar?", function (result) {
    if (result) { // ok button was pressed
        $.post('/evaluador/asignar', { _csrf:csrfToken, datos:{ rfcId:rfc, solicitudId:solicitud, institutoId:instituto } })
        .done(function(d) {
          if(d !== '0') {
            var datos = JSON.parse(d);
              krajeeDialog.alert('Se ha asignado evaluador el Usuario '+ datos.rfc);  
              $.pjax.reload({container:'#pjax_evaluadores'});
              $('#ventana').modal('hide');
              window.location.reload();
             }
        }).fail(function(f) { console.log(f.responseText); });
    } else { // confirmation was cancelled
        krajeeDialog.alert('Operación Cancelada');
    }
    });
  
}


//funciones ajax borra evaluadores y sus rubricas
function borrarEvaluador(id) {
     var solicitud = $('input[name=fksol]').val();
    krajeeDialog.confirm("<h4>Seguro de eliminar a este evaluador?, se borraran todas sus rubricas?</h4>", function (result) {
    if (result) { // ok button was pressed
        $.post('/evaluador/borrar', { _csrf:csrfToken, datos:{ id:id, solicitudId:solicitud } })
        .done(function(d) {
          if(d !== '0') {
            var datos = JSON.parse(d);
              krajeeDialog.alert('Se elimino correctamento el usuario y sus registros '+ datos.usuario);  
              $.pjax.reload({container:'#pjax_evaluadores'});
              window.location.reload();
             }
        }).fail(function(f) { console.log(f.responseText); });
    } else { // confirmation was cancelled
        krajeeDialog.alert('<h4>Operación cancelada</h4>');
    }
    });
  
}

//funciones ajax borra evaluadores, solicitud, requisitos y rubricas
function borrarSolicitud(id) {
    krajeeDialog.confirm("<h4>Está por eliminar la solicitud " + id +"? \n Se borraran sus evaluadores, requisitos y rúbricas asignadas</h4>", function (result) {
    if (result) { // ok button was pressed
        $.post('/solicitud/borrar-solicitud', { _csrf:csrfToken, datos:{ id:id } })
        .done(function(d) {
          if(d !== '0') {
            var datos = JSON.parse(d);
              krajeeDialog.alert('Se elimino correctamento la solicitud '+ datos.id + ' con sus requisitos, rubrica y evaluadores ');  
              window.location.reload();
             }
        }).fail(function(f) { console.log(f.responseText); });
    } else { // confirmation was cancelled
        krajeeDialog.alert('<h4>Operación cancelada</h4>');
    }
    });
  
}

//Envia correo electrónico a los institutos con dictamen
function enviarDictamen(id) {
    var textomensaje = "<h4>También se enviará notificación a Servicios Escolares\n para iniciar el proceso de registro ante profesiones";
    krajeeDialog.confirm("<h4>Está por envíar un correo de la solicitud " + id +" \n con el dictamen final</h4><BR>" + textomensaje, function (result) {
    if (result) { // ok button was pressed
        krajeeDialog.alert('Enviando correo.... espere ');  
        $.post('/solicitud/enviar-dictamen', { _csrf:csrfToken, datos:{ id:id } })
        .done(function(d) {
          if(d !== '0') {
            var datos = JSON.parse(d);
              krajeeDialog.alert('Se ha enviado el correo de la solicitud '+ datos.id + ' con su dictamen correspondiente ');  
              window.location.reload();
             }
        }).fail(function(f) { console.log(f.responseText); });
    } else { // confirmation was cancelled
        krajeeDialog.alert('<h4>Operación cancelada</h4>');
    }
    });
  
}


//funciones ajax borra evaluadores, solicitud, requisitos y rubricas
function cambiarSolicitud(id, accion) {
    switch (accion) {
     case 1:
     krajeeDialog.confirm("<h4>Está por cambiar a modo captura la solicitud " + id +" \n Seguro de realizar esta operación ?</h4>", function (result) {
        if (result) { // ok button was pressed
            $.post('/solicitud/cambiar-solicitud', { _csrf:csrfToken, datos:{ id:id, estatus:accion } })
            .done(function(d) {
              if(d !== '0') {
                var datos = JSON.parse(d);
                  krajeeDialog.alert('Operación exitosa '+ datos.solicitud);  
                  window.location.reload();
                 }
            }).fail(function(f) { console.log(f.responseText); });
        } else { // confirmation was cancelled
            krajeeDialog.alert('<h4>Operación cancelada</h4>');
        }
        });
     break;
     case 3:
     krajeeDialog.confirm("<h4>Está por autorizar la solicitud " + id +" \n Seguro de realizar esta operación ?</h4>", function (result) {
        if (result) { // ok button was pressed
            $.post('/solicitud/cambiar-solicitud', { _csrf:csrfToken, datos:{ id:id, estatus:accion } })
            .done(function(d) {
              if(d !== '0') {
                var datos = JSON.parse(d);
                  krajeeDialog.alert('Operación exitosa '+ datos.solicitud);  
                  window.location.reload();
                 }
            }).fail(function(f) { console.log(f.responseText); });
        } else { // confirmation was cancelled
            krajeeDialog.alert('<h4>Operación cancelada</h4>');
        }
        });
     break;
     case 4:
      krajeeDialog.confirm("<h4>Está por declinar la solicitud " + id +" \n Seguro de realizar esta operación ?</h4>", function (result) {
        if (result) { // ok button was pressed
            $.post('/solicitud/cambiar-solicitud', { _csrf:csrfToken, datos:{ id:id, estatus:accion } })
            .done(function(d) {
              if(d !== '0') {
                var datos = JSON.parse(d);
                  krajeeDialog.alert('Operación exitosa '+ datos.solicitud);  
                  window.location.reload();
                 }
            }).fail(function(f) { console.log(f.responseText); });
        } else { // confirmation was cancelled
            krajeeDialog.alert('<h4>Operación cancelada</h4>');
        }
        }); 
        break;
        }    
}



function comentario(id,requisitoId,usuario,bandera,accion) {
  switch (accion) {
      case 0:
       $.post('/solicitudrequisito/comentario', {_csrf:csrfToken, accion:2, id:id, requisito:requisitoId, usuarioId:usuario, banderaId:bandera})
        .done(function(d) {
          if(d !== undefined) {
            if(d !== null) {
              var com = JSON.parse(d);
          bootbox.dialog({
          message: ( bandera == 2 ) ? com.observa1 : com.observa2,
          size:'medium',
          title: "Observaciones",
          buttons: {
            success: {
              label: "Entendido",
              className: "btn-success",
            },
          }
        });
          
                }
            }
        });
          
          break;
          case 1:
            $.post('/solicitudrequisito/comentario', {_csrf:csrfToken, accion:2, id:id, requisito:requisitoId, usuarioId:usuario, banderaId:bandera})
            .done(function(d) {
              if(d !== undefined) {
                if(d !== null) {
                  var com = JSON.parse(d);
                  bootbox.prompt({
                    title: 'Subir observación',
                    value: ( bandera == 2 ) ? com.observa1 : com.observa2,
                    inputType:'textarea',
                    buttons: {
                        'cancel': {
                            label: 'Cancelar',
                            className: 'btn-danger pull-left'
                        },
                        'confirm': {
                            label: 'Modificar',
                            className: 'btn-success pull-right'
                        }
                    },
                    callback: function(comentario) {
                        if (comentario === null) {
                            alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                        } else {
                          $.post('/solicitudrequisito/comentario', {_csrf:csrfToken, accion:1, id:id, requisito:requisitoId, usuarioId:usuario, comentario:comentario, banderaId:bandera})
                          .done(function(d) { 
                            if(parseInt(d) == 1) {
                              window.location.reload();
                            } else {
                              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            }        
                          })
                          .fail(function(f) { 
                            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            console.log(f.responseText);  
                          });    
                        }
                      }
                  });                
                }
              }
            }).fail(function(f) { 
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
              console.log(f.responseText); 
            });
          break;
  }
}

function comentarioRubrica(id,rubricaId,usuario,bandera,accion) {
  switch (accion) {
      case 0:
       $.post('/solicitudrubrica/comentario', {_csrf:csrfToken, accion:2, id:id, rubrica:rubricaId, usuarioId:usuario, banderaId:bandera})
        .done(function(d) {
          if(d !== undefined) {
            if(d !== null) {
              var com = JSON.parse(d);
          bootbox.dialog({
          message: ( bandera == 2 ) ? com.observa1 : com.observa2,
          size:'medium',
          title: "Observaciones",
          buttons: {
            success: {
              label: "Entendido",
              className: "btn-success",
            },
          }
        });
          
                }
            }
        });
          
          break;
          case 1:
            $.post('/solicitudrubrica/comentario', {_csrf:csrfToken, accion:2, id:id, rubrica:rubricaId, usuarioId:usuario, banderaId:bandera})
            .done(function(d) {
              if(d !== undefined) {
                if(d !== null) {
                  var com = JSON.parse(d);
                  bootbox.prompt({
                    title: 'Subir observación',
                    value: ( bandera == 2 ) ? com.observa1 : com.observa2,
                    inputType:'textarea',
                    buttons: {
                        'cancel': {
                            label: 'Cancelar',
                            className: 'btn-danger pull-left'
                        },
                        'confirm': {
                            label: 'Modificar',
                            className: 'btn-success pull-right'
                        }
                    },
                    callback: function(comentario) {
                        if (comentario === null) {
                            alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                        } else {
                          $.post('/solicitudrubrica/comentario', {_csrf:csrfToken, accion:1, id:id, rubrica:rubricaId, usuarioId:usuario, comentario:comentario, banderaId:bandera})
                          .done(function(d) { 
                            if(parseInt(d) == 1) {
                              window.location.reload();
                            } else {
                              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            }        
                          })
                          .fail(function(f) { 
                            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            console.log(f.responseText);  
                          });    
                        }
                      }
                  });                
                }
              }
            }).fail(function(f) { 
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
              console.log(f.responseText); 
            });
          break;
  }
}

//Función para grabar comentarios en solicitudes de cancelación y liquidación
function comentarioCancelacion(id,accion) {
  switch (accion) {
      case 0:
       $.post('/solicitud/comentario', {_csrf:csrfToken, accion:2, id:id})
        .done(function(d) {
          if(d !== undefined) {
            if(d !== null) {
              var com = JSON.parse(d);
          bootbox.dialog({
          message: com.observa1,
          size:'medium',
          title: "Observaciones",
          buttons: {
            success: {
              label: "Entendido",
              className: "btn-success",
            },
          }
        });
          
                }
            }
        });
          
          break;
          case 1:
            $.post('/solicitud/comentario', {_csrf:csrfToken, accion:2, id:id})
            .done(function(d) {
              if(d !== undefined) {
                if(d !== null) {
                  var com = JSON.parse(d);
                  bootbox.prompt({
                    title: 'Subir observación',
                    value: com.observa1,
                    inputType:'textarea',
                    buttons: {
                        'cancel': {
                            label: 'Cancelar',
                            className: 'btn-danger pull-left'
                        },
                        'confirm': {
                            label: 'Modificar',
                            className: 'btn-success pull-right'
                        }
                    },
                    callback: function(comentario) {
                        if (comentario === null) {
                            alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                        } else {
                          $.post('/solicitud/comentario', {_csrf:csrfToken, accion:1, id:id, comentario:comentario})
                          .done(function(d) { 
                            if(parseInt(d) == 1) {
                              window.location.reload();
                            } else {
                              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            }        
                          })
                          .fail(function(f) { 
                            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            console.log(f.responseText);  
                          });    
                        }
                      }
                  });                
                }
              }
            }).fail(function(f) { 
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
              console.log(f.responseText); 
            });
          break;
  }
}

//Función para grabar dictamen del evaluador antes de imprimir
function dictamenEvaluador(id,bandera,accion) {
  switch (accion) {
      case 0:
       $.post('/solicitud/dictamen-evaluador', {_csrf:csrfToken, accion:2, id:id, banderaId:bandera})
        .done(function(d) {
          if(d !== undefined) {
            if(d !== null) {
              var com = JSON.parse(d);
          bootbox.dialog({
          message: ( bandera == 2 ) ? com.observa1 : com.observa2,
          size:'medium',
          title: "Recomendaciones",
          buttons: {
            success: {
              label: "Entendido",
              className: "btn-success",
            },
          }
        });
          
                }
            }
        });
          
          break;
          case 1:
            $.post('/solicitud/dictamen-evaluador', {_csrf:csrfToken, accion:2, id:id, banderaId:bandera})
            .done(function(d) {
              if(d !== undefined) {
                if(d !== null) {
                  var com = JSON.parse(d);
                  bootbox.prompt({
                    title: 'Escribir sus recomendaciones o comentarios',
                    value: ( bandera == 2 ) ? com.observa1 : com.observa2,
                    inputType:'textarea',
                    buttons: {
                        'cancel': {
                            label: 'Cancelar',
                            className: 'btn-danger pull-left'
                        },
                        'confirm': {
                            label: 'Modificar',
                            className: 'btn-success pull-right'
                        }
                    },
                    callback: function(comentario) {
                        if (comentario === null) {
                            alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                        } else {
                          $.post('/solicitud/dictamen-evaluador', {_csrf:csrfToken, accion:1, id:id, comentario:comentario, banderaId:bandera})
                          .done(function(d) { 
                            if(parseInt(d) == 1) {
                              window.location.reload();
                            } else {
                              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            }        
                          })
                          .fail(function(f) { 
                            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            console.log(f.responseText);  
                          });    
                        }
                      }
                  });                
                }
              }
            }).fail(function(f) { 
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
              console.log(f.responseText); 
            });
          break;
  }
}

//Función para grabar el numero de oficio de la solicitud del tecnologico
function oficioSolicitud(id,accion,bandera) {
  switch (accion) {
        case 1:
            $.post('/solicitud/oficio-solicitud', {_csrf:csrfToken, accion:2, id:id, banderaId:bandera})
            .done(function(d) {
              if(d !== undefined) {
                if(d !== null) {
                  var com = JSON.parse(d);
                  bootbox.prompt({
                    title: ( bandera == 1 ) ? 'Escriba el número de oficio del Solicitante':'Escriba el número de oficio de Tecm',
                    value: ( bandera == 1 ) ? com.oficiosolicitud : com.oficiotecnm,
                    inputType:'text',
                    buttons: {
                        'cancel': {
                            label: 'Cancelar',
                            className: 'btn-danger pull-left'
                        },
                        'confirm': {
                            label: 'Modificar',
                            className: 'btn-success pull-right'
                        }
                    },
                    callback: function(comentario) {
                        if (comentario === null) {
                            alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                        } else {
                          $.post('/solicitud/oficio-solicitud', {_csrf:csrfToken, accion:1, id:id, banderaId:bandera, comentario:comentario})
                          .done(function(d) { 
                            if(parseInt(d) == 1) {
                              window.location.reload();
                            } else {
                              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            }        
                          })
                          .fail(function(f) { 
                            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            console.log(f.responseText);  
                          });    
                        }
                      }
                  });                
                }
              }
            }).fail(function(f) { 
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
              console.log(f.responseText); 
            });
          break;
  }
}


//Función para grabar la fecha de autorizacion de la oferta educativa del tecnologico
function fechaAutorizacion(id,accion) {
  switch (accion) {
        case 1:
            $.post('/solicitud/fecha-autorizacion', {_csrf:csrfToken, accion:2, id:id})
            .done(function(d) {
              if(d !== undefined) {
                if(d !== null) {
                  var com = JSON.parse(d);
                  bootbox.prompt({
                    title: 'Fecha de Autorización de la Oferta Educativa',
                    value: com.fechaautorizacion,
                    inputType:'date',
                    buttons: {
                        'cancel': {
                            label: 'Cancelar',
                            className: 'btn-danger pull-left'
                        },
                        'confirm': {
                            label: 'Modificar',
                            className: 'btn-success pull-right'
                        }
                    },
                    callback: function(comentario) {
                        if (comentario === null) {
                            alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                        } else {
                          $.post('/solicitud/fecha-autorizacion', {_csrf:csrfToken, accion:1, id:id, comentario:comentario})
                          .done(function(d) { 
                            if(parseInt(d) == 1) {
                              window.location.reload();
                            } else {
                              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            }        
                          })
                          .fail(function(f) { 
                            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            console.log(f.responseText);  
                          });    
                        }
                      }
                  });                
                }
              }
            }).fail(function(f) { 
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
              console.log(f.responseText); 
            });
          break;
  }
}

//funciones ajax borra institutos exentos de la lista
function borrarInstitutoExento(id) {
    krajeeDialog.confirm("<h4>Está por quitar el tecnologico " + id +" de la lista,\n Esta seguro ?</h4>", function (result) {
    if (result) { // ok button was pressed
        $.post('/institutoexento/borrar-instituto', { _csrf:csrfToken, datos:{ id:id } })
        .done(function(d) {
          if(d !== '0') {
            var datos = JSON.parse(d);
              krajeeDialog.alert('Se elimino correctamento de la lista el tecnológico '+ datos.id );  
              window.location.reload();
             }
        }).fail(function(f) { console.log(f.responseText); });
    } else { // confirmation was cancelled
        krajeeDialog.alert('<h4>Operación cancelada</h4>');
    }
    });
  
}

//funciones ajax borra institutos con permisos para enviar fuera del periodo
function borrarInstitutoPermiso(id) {
    krajeeDialog.confirm("<h4>Está por quitar el tecnologico " + id +" de la lista,\n Esta seguro ?</h4>", function (result) {
    if (result) { // ok button was pressed
        $.post('/institutopermiso/borrar-instituto', { _csrf:csrfToken, datos:{ id:id } })
        .done(function(d) {
          if(d !== '0') {
            var datos = JSON.parse(d);
              krajeeDialog.alert('Se elimino correctamento de la lista el tecnológico '+ datos.id );  
              window.location.reload();
             }
        }).fail(function(f) { console.log(f.responseText); });
    } else { // confirmation was cancelled
        krajeeDialog.alert('<h4>Operación cancelada</h4>');
    }
    });
  
}



//Calcula el total de la rubrica
function calcularRubrica(solicitud, bandera) {
    $.post('/solicitudrubrica/calcular-rubrica', { _csrf:csrfToken, solId:solicitud, banId:bandera })
    .done(function(d) {
      var datos = JSON.parse(d);
    bootbox.confirm({
      title  : 'Notificación del sistema',
      message: datos.mensaje,
      buttons: {
          'cancel': {
              label: 'Salir',
              className: 'btn-danger pull-left',
          },
          'confirm': {
              label: 'Entendido',
              className: 'btn-success pull-right',
          }
      },
      callback: function(result) {
        if (result == true) {
                window.location.reload();
        }else{
                window.location.reload();
        }
        }
    })
    }).fail(function(f) { console.log(f.responseText); });
}

function estatus(ticket, estatus) {
  $.post('/ticket/estatus-ticket', { _csrf:csrfToken, datos:{ ticket:ticket, estatus:estatus } })
  .done(function(d) {
    if(d !== '0') {
      var est = JSON.parse(d);
      if(est.id == '4') {
        $('#btn-asignar').prop('disabled', true);
      } else if(est.id == '5') {
        $('#btn-asignar').prop('disabled', true);
      } else {
        $('#btn-asignar').prop('disabled', false);
      }      
      $('#estatus').text(est.nmb);
      window.location.reload();
    }
  }).fail(function(f) { console.log(f.responseText); });
}

function finSeguimiento(asId, p) {
  var reporte = $('#editor-reporte').html();
  bootbox.confirm({
      title: 'Finalizar seguimiento.',
      message: 'Está a punto de finalizar el seguimiento de esta asignación, por lo cuál el <b>reporte</b> capturado y las <b>evidencias</b> agregadas no podrán modificarse más adelante, ¿Deseas finalizar el seguimiento?',
      buttons: {
          'cancel': {
              label: 'Cancelar',
              className: 'btn-danger pull-left',
          },
          'confirm': {
              label: 'Confirmar',
              className: 'btn-success pull-right',
          }
      },
      callback: function(result) {
        if (result == true) {
          $.post('/ticket/finalizar-seguimiento', {_csrf:csrfToken, reporte:reporte, asignacion:asId})
          .done(function(d) { 
            if(parseInt(d) == 1) {
              if(p !== 0) {
                window.location.reload(); 
              } else {
                window.location.href = '/'; 
              }
              
            } else {
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
            }        
          })
          .fail(function(f) { 
            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
            console.log(f.responseText);  
          });               
        } else {
          alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
        }
      }
  });
}



function ticketInfo(id) {
  $.get('/ticket/ticket-info', {id:id})
  .done(function(html) {
    if(html !== null) {
      if(html !== undefined) {
        bootbox.dialog({
          message: html,
          size:'large',
          title: "Visualizar información",
          buttons: {
            success: {
              label: "Entendido",
              className: "btn-success",
            },
          }
        });
      } else {
        alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
      }
    } else {
      alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
    }

  }).fail(function(f) { console.log(f.responseText); });
}

function dirKCFinder(asId, tecId) {
  $.get('/ticket/dir-kcfinder', {tecId:tecId, asId:asId})
  .done(function(d) {
  }).fail(function(f) { console.log(f.responseText); });
  return true;
}

function verReporte(asId) {
  $.get('/ticket/obtener-reporte', {asId:asId})
  .done(function(d) {
    if(d !== undefined) {
      bootbox.dialog({
        message: d,
        title: "<h4>Visualizar Reporte - Asignación #"+asId+"</h4>",
        buttons: {
          success: {
            label: "Entendido",
            className: "btn-success",
          },
        }
      });   
    } else {
      bootbox.alert({ 
          size: 'small',
          message: "Ha ocurrido un error al obtener éste reporte.", 
      });      
    }
  }).fail(function(f) { console.log(f.responseText); });
}

function verEvidencias(dir) {
  if(dir !== undefined) {
    $.get('/ticket/evidencias', {dir:dir})
    .done(function(html) {
      if(html !== null) {
        bootbox.dialog({
          message: html,
          size:'large',
          title: "Visualizar evidencias",
          buttons: {
            success: {
              label: "Entendido",
              className: "btn-success",
            },
          }
        });  
      } else {
                alertify.error('<strong><font color="white">No se encontraron evidencias.</font></strong>');
      }
    }).fail(function(f) { 
      bootbox.dialog({
        message: '<div align="center"><p>No se encontraron evidencias.</p></div>',
        size:'small',
        title: "Notificación",
        buttons: {
          success: {
            label: "Entendido",
            className: "btn-success",
          },
        }
      });      
      //console.log(f.responseText); 
    });    
  } else {
    alertify.error('<strong><font color="white">No se encontró un directorio con evidencias.</font></strong>');
  }

}
