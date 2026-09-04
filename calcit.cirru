
{} (:about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --full` first. Manual edits must follow format and schema conventions, then run `calcit edit format`.") (:package |app)
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'app.main/main!) (:mode :native) (:reload-fn 'app.main/reload!)
      :feature-policy $ {}
      :modules $ [] |calcit.std/
      :type-slots $ {}
    :test $ {} (:description |) (:init-fn 'app.test/main!) (:mode :native) (:reload-fn 'app.test/reload!)
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
  :files $ {}
    'app.main $ %{} 'FileEntry
      :defs $ {}
        'calling-func $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn calling-func () $ println "|todo bcc"
          :examples $ []
          :schema $ :: 'Dynamic
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () (run-tests)
              set-interval 2000 $ fn () (calling-func)
          :examples $ []
          :schema $ :: 'Dynamic
        'on-error $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn on-error (message) (; draw-error-message message)
          :examples $ []
          :schema $ :: 'Dynamic
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ echo |Reloaded.
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.main $ :require
            app.test :refer $ run-tests
            calcit.std.time :refer $ set-interval
    'app.test $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () $ run-tests
          :examples $ []
          :schema $ :: 'Dynamic
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ println "|TODO reload"
          :examples $ []
          :schema $ :: 'Dynamic
        'run-tests $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn run-tests () $ test-add
          :examples $ []
          :schema $ :: 'Dynamic
        'test-add $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn test-add () $ is= 2 (+ 1 1)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.test $ :require
            calcit.test :refer $ is=
