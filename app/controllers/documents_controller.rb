class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]


  # GET /drive
  def drive
    @documents = Document.all
    @document = Document.new
  end

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
    @document = Document.new
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create

    @document_space = DocumentSpace.find(document_params[:document_space_id])

    @document = Document.new(document_params)
    @document.document_space_id = @document_space.id
    @document.name = document_params[:attachment].original_filename

    if @document.save
         redirect_to request.referrer, notice: document_params[:attachment].original_filename+' has been saved.'
    else
         redirect_to request.referrer, notice: @document.errors.full_messages
    end

  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:attachment, :document_space_id)
    end
end
