Rails.application.routes.draw do
  # GETはデータの取得。aタグなどで、画面遷移の際に新しいページを取得する場合はGET。
  # POSTはデータの新規保存。フォーム等で投稿をする場合はPOST。
  # PATCHはデータの更新。
  # 「HTMLメソッド 'URL' => 'コントローラ名#アクション名'」という書き方。
  # rootメソッドを用いた、ルートディレクトリ(/)へのルーティング設定。(top画面をルートパス(最上位階層のURL)に設定している)
  root :to => 'homes#top'

    # resourcesメソッド…ルーティングを一括して自動生成してくれる。
    # この場合、booksコントローラの同じ名前のアクションに紐づく形で、以下のルーティングを自動生成してくれる。
  # resources :books => index,show,new,create,edit,update,destroyの7つのアクションのルーティングをrails側が自動生成してくれる。
  # HTTPメソッドも自動設定してくれるので、いちいちpost、patch、deleteとか記述しなくていい。
  post 'books' => 'books#create'
  get 'books' => 'books#index'
    # 詳細画面(show)はどの投稿データを表示するかを判別するために、投稿データのidもURLに含める。
    # 詳細画面で呼び出される投稿データは、URLの/books/:id内の:idで判別する。 この:idは、アクション内にparams[:id]と記述する事で取得可能。
    # as: 'book'…名前付きルート。ルーティング自体に名前をつけておく事。名前付きルートがあると、その名前をredirect_toやlink_toでも使用可能。
    # as:オプションを追加することで設定が出来る。 ここでは「'books#show'の設定を、bookとして利用できる」の意味。
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'    # resources :booksで纏めたせいで、名前付きルートupdate_bookが消えててエラーが起きた
  delete 'books/:id' => 'books#destroy', as: 'destroy_book' # resources :booksで纏めたせいで、名前付きルートdestroy_bookが消えててエラーが起きた
end
