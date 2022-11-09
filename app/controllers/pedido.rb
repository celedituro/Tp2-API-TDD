WebTemplate::App.controllers :pedidos, :provides => [:json] do
  post :create, :map => '/pedido' do
    # usuario = UsuarioCreator.new(usuario_repository).crear_usuario(parametros_usuario[:nombre], parametros_usuario[:direccion], parametros_usuario[:telefono])
    # pedido = Pedido.new(parametros_pedido[:id],parametros_pedido[:nombre])
    # pedido = {
    #  nombre_menu: 'Menu individual',
    #  id_pedido: 300
    # }
    status 201
  end
end
