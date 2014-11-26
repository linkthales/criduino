class ArduinosController < ApplicationController
  helper :all
  before_filter :require_authentication, :only => [:new, :edit, :create, :update, :destroy]


  def index
    @arduinos = Arduino.all
  end

  def show
    arduino_model = Arduino.find(params[:id])
	@arduino = ArduinoPresenter.new(arduino_model, self)
  end

  def new
    @arduino = current_user.arduinos.build
  end

  def edit
    @arduino = current_user.arduinos.find(params[:id])
  end

  def create
    @arduino = current_user.arduinos.build(params[:arduino])

    if @arduino.save
      redirect_to @arduino, :notice => t('flash.notice.arduino_created')
    else
      render action: "new"
    end
  end

  def update
    @arduino = current_user.arduinos.find(params[:id])

    if @arduino.update_attributes(params[:arduino])
      redirect_to @arduino, :notice => t('flash.notice.arduino_updated')
    else
      render :action => "edit"
    end
  end

  def destroy
    @arduino = current_user.arduinos.find(params[:id])
    @arduino.destroy

	redirect_to arduinos_url
  end

  def leitura
    require 'socket'
    require 'openssl'
    @arduino = current_user.arduinos.find(params[:id])
    server = TCPServer.new('192.168.0.103', 3000)
    loop do
      Thread.start(server.accept) do |client|
        chain = client.gets
        maca = @arduino.mac + "\r\n"
        if (chain == maca)
          client.puts(1)
          server.close
        end
      end
      client.close
    end
  end
  
  def escrita
    require 'socket'
    require 'openssl'
    @arduino = current_user.arduinos.find(params[:id])
    server = TCPServer.new('192.168.0.103', 3000)
    loop do
      Thread.start(server.accept) do |client|
        chain = client.gets
        maca = @arduino.mac + "\r\n"
        if (chain == maca)
          client.puts(0)
          server.close
        end
      end
      client.close
    end
  end
end