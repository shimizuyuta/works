class WorksController < ApplicationController
    
    def index
        if logged_in?
           @works = Work.all
        end
    end
    
    def show
        @work =  Work.find(params[:id])
    end
    def new
        @work= Work.new
    end
    
    def create
        @work = Work.new(work_params)
        if @work.save
            flash[:success]='work'
            # link_to 'work_path
            redirect_to @work
        else
            flash.now[:danger]='work'
            reder:new
        end
        
    end
    def edit
        @work= Work.find(params[:id])
    end
    def update
        @work= Work.find(params[:id])
        if @work.update(work_params)
            flash[:success]='成功しました'
            redirect_to @work
        else
            flash.now[:danger]='失敗しました'
            render :edit
        end
    end
    def destroy
         @work = Work.find(params[:id])
         @work.destroy

         flash[:success] = 'Message は正常に削除されました'
         redirect_to works_url
    end
    private
    def work_params
        params.require(:work).permit(:content)
    end
end

