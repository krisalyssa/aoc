(ns day-05-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-05 :refer [part1 part2]]))

(deftest day-05-test
  (testing "sample data"
    (is (= 0 (part1 "../data/05-sample.txt")))
    (is (= 0 (part2 "../data/05-sample.txt")))))
