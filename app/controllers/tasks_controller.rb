class TasksController < ApplicationController
  before_action :set_task,only:[:show,:edit,:destory,:update]
  # model"Task"に対するController
  
  def index
    @tasks = Task.all
  end
  
  #id　詳細ページ指定
  def show
    set_task
  end
  
  def new
    @task = Task.new
  end
  
  # newページより送られてきたフォームの処理
  def create
    @task = Task.new(task_params)
    
    if @task.save
      #flashページ作る必要あり
      flash[:success] = "Taskが登録されました"
      
      #該当する詳細ページへ遷移
      redirect_to @task
      
    else
      flash.now[:danger] = "Taskが登録できませんでした"
      
      #新規作成ページを表示
      render :new
    end
  end
  
  #既存タスクの編集ページ
  def edit
    set_task
  end
  
  #既存タスクの更新処理
  def update
    set_task
    
    if @task.update(task_params)
      flash[:sucess] = "タスクが正常に編集されました"
      
      redirect_to @task
    else
      flash.now[:danger] = "タスクが編集できませんでした"
      render :edit
    end
  end
  
  def destroy
    
    set_task
    
    @task.destroy
    flash[:success] = "タスクは正常に削除されました"
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  #セキュリティ強固のため、フィルター作成
  def task_params
    # params.require(:message)でTaskモデルのフォームから得られるものに限定
    # .permit(:content)で必要なカラムを選択
    
    #add status
    params.require(:task).permit(:content,:status)
  end
end