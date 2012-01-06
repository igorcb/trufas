class VendasController < ApplicationController
  USERNAME, PASSWORD = "admin", "q2w3e4"
  before_filter :checked_logged_in#, :only => [:any]
  #before_filter :checked_logged_in, :only => [:new, :create, :edit, :update]

  autocomplete :cliente, :nome, :full => true

  def search
    @vendas = Venda.where('DATE(created_at) = ?',params[:query])
  end

  def receber
     @venda = Venda.find(params[:id])
     @venda.pago = true
     if @venda.save
       redirect_to(vendas_url)
     end
  end

  def index_all
    @vendas = Venda.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vendas }
    end
  end

  # GET /vendas
  # GET /vendas.xml
  def index
    #@vendas = Venda.all
    @vendas = Venda.venda_diaria	

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vendas }
    end
  end

  # GET /vendas/1
  # GET /vendas/1.xml
  def show
    @venda = Venda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venda }
    end
  end

  # GET /vendas/new
  # GET /vendas/new.xml
  def new
    @venda = Venda.new
    #Produto.count.times { @venda.items.build }
    Produto.count.times { @venda.items.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venda }
    end
  end

  # GET /vendas/1/edit
  def edit
    @venda = Venda.find(params[:id])
  end

  # POST /vendas
  # POST /vendas.xml
  def create
    @venda = Venda.new(params[:venda])

    respond_to do |format|
      if @venda.save
        format.html { redirect_to(@venda, :notice => 'Venda was successfully created.') }
        format.xml  { render :xml => @venda, :status => :created, :location => @venda }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vendas/1
  # PUT /vendas/1.xml
  def update
    @venda = Venda.find(params[:id])

    respond_to do |format|
      if @venda.update_attributes(params[:venda])
        format.html { redirect_to(@venda, :notice => 'Venda was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.xml
  def destroy
    @venda = Venda.find(params[:id])
    @venda.destroy

    respond_to do |format|
      format.html { redirect_to(vendas_url) }
      format.xml  { head :ok }
    end
  end

private

  def checked_logged_in
    authenticate_or_request_with_http_basic("trufas") do |username, password|
      username == USERNAME && password == PASSWORD
    end
  end
  
end
