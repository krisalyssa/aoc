(ns day-01
  (:gen-class))

(require '[clojure.data.json :as json])
(require '[clojure.string :as str])

;; (defn read-file-as-one-string
;;   "Reads the file and returns it as a single string."
;;   [filename]
;;   (str/trim-newline (slurp filename)))

(defn read-file-as-string-list
  "Reads the file and returns it as a list of strings."
  [filename]
  (str/split-lines
   (slurp filename)))

(defn part1 [_data]
  0)

(defn part2 [_data]
  0)

(defn -main []
  (printf "%s%n" (json/write-str {:day_01 [(part1 (read-file-as-string-list "../data/01.txt")) (part2 (read-file-as-string-list "../data/01.txt"))]} :indent true)))
