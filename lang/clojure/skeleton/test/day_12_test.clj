(ns day-12-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-12 :refer [part1 part2]]))

(deftest day-12-test
  (testing "sample data"
    (is (= 0 (part1 "../data/12-sample.txt")))
    (is (= 0 (part2 "../data/12-sample.txt")))))
