class TurmasController < ApplicationController
  before_action :set_turma, only: [:show, :edit, :update, :destroy]



  def add_attributes
    aluno = User.find(params["user_id"])
    aluno.user_attribute.add_attribute(params['commit'], params['value'])

    aluno.user_attribute.save
    redirect_back(fallback_location: root_path, alert: "sucesso")

  end


  def add_aluno
    @turma = Turma.find(params[:turma_id])
    newAluno = User.find_by(email: params[:email])

    begin 
      @turma.users << newAluno
      @turma.save
      
      if newAluno.user_attribute.nil?
        newAluno.user_attribute = UserAttribute.new do | user_attributes |
          user_attributes.level = 1
          user_attributes.xp   = 0
          user_attributes.hp    = 50
          user_attributes.mana  = 30
          user_attributes.money = 50
        end 
      end


      message = "Aluno cadastrado com sucesso"
    rescue Exception => e
      e.message
      message = "Não foi possível cadastrar o aluno\r\n Error:  " + e.message + ")" 
    end

    redirect_back(fallback_location: root_path, alert: message)
    
  end



  # GET /turmas
  # GET /turmas.json
  def index
    @turmas = Turma.all
  end

  # GET /turmas/1
  # GET /turmas/1.json
  def show
    @turma = Turma.find(params[:id])
  end

  # GET /turmas/new
  def new
    @turma = Turma.new
  end

  # GET /turmas/1/edit
  def edit
  end

  # POST /turmas
  # POST /turmas.json
  def create
    @turma = Turma.new(turma_params)

    respond_to do |format|
      if @turma.save
        format.html { redirect_to @turma, notice: 'Turma was successfully created.' }
        format.json { render :show, status: :created, location: @turma }
      else
        format.html { render :new }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turmas/1
  # PATCH/PUT /turmas/1.json
  def update
    respond_to do |format|
      if @turma.update(turma_params)
        format.html { redirect_to @turma, notice: 'Turma was successfully updated.' }
        format.json { render :show, status: :ok, location: @turma }
      else
        format.html { render :edit }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turmas/1
  # DELETE /turmas/1.json
  def destroy
    @turma.destroy
    respond_to do |format|
      format.html { redirect_to turmas_url, notice: 'Turma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turma
      @turma = Turma.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def turma_params
      params.require(:turma).permit(:nome, :inicio, :fim, :horas, :image)
    end
end
