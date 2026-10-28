
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'app.main/main!) (:mode :native) (:reload-fn 'app.main/reload!) (:target :native)
      :feature-policy $ {}
      :modules $ [] |calcit.std/
      :type-slots $ {}
    :test $ {} (:description |) (:init-fn 'app.test/main!) (:mode :native) (:reload-fn 'app.test/reload!) (:target :native)
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
  :files $ {}
    'app.main $ %{} 'FileEntry
      :defs $ {}
        'calling-func $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn calling-func () (println "|todo bcc") &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (run-tests)
            set-interval! 2000 $ fn () $ calling-func
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
        'on-error $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-error (message) (; draw-error-message message) &unit
          :examples $ []
          :schema $ quote $ Fn String (-> Unit)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (echo |Reloaded.) &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require
            app.test :refer $ run-tests
            calcit.std.time :refer $ set-interval!
    'app.test $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (run-tests)
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (println "|TODO reload") &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
        'run-tests $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn run-tests () (test-add)
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
        'test-add $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn test-add ()
            is= 2 $ + 1 1
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.test
          :require $ calcit.test :refer $ is=
