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
    server = TCPServer.new 3000
    print("teste transudo")
    loop do
      client = server.accept    # Wait for a client to connect
      s = client.readline
      puts s
      s.printf
      client.close
    end
  end
end