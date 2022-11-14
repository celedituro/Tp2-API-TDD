require 'spec_helper'

describe Autorizacion do

    it 'debe lanzar UsuarioNoRegistrado cuando el id no esta en la base de datos' do
      mock_repository = instance_double('usuario_repository')
  
      autorizacion = described_class.new(mock_repository)
      id_autorizado = 2

      allow(mock_repository).to receive(:buscar_por_id).with(id_autorizado).and_raise(ObjectNotFound.new('Usuario',2))
      expect { autorizacion.autorizar(id_autorizado) }.to raise_error(UsuarioNoRegistrado, 'usuario no registrado')
    end
end