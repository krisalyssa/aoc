(ns day-21-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-21 :refer [part1 part2]]))

(deftest day-21-test
  (testing "sample data"
    (is (= 0 (part1 "../data/21-sample.txt")))
    (is (= 0 (part2 "../data/21-sample.txt")))))
